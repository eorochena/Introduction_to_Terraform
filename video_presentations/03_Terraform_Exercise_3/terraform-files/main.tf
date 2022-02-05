######################
# Configure Provider #
######################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.87.0"
    }
  }
}

############
# Provider #
############

provider "azurerm" {
  features {}
}

#####################
# Public IP Address #
#####################

data "http" "ip_address" {
  url = "http://ipv4.icanhazip.com"
}

###################
# Local Variables #
###################

locals {
  required_tags = {
    environment         = var.labels["environment"]
    subscription        = var.labels["subscription"]
    market              = var.labels["market"]
    resource_group_type = var.labels["resource_group_type"]
  }
}

##################
# Resource Group #
##################

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location

  tags = local.required_tags
}

#########################
# Network Configuration #
#########################

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.resource_group}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  count               = var.numVMs
  name                = "${var.resource_group}-public-ip-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "network_if" {
  count                         = var.numVMs
  name                          = "${var.resource_group}-if-${count.index}"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  enable_accelerated_networking = var.acc_net

  ip_configuration {
    name                          = "${var.resource_group}-ip-conf"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }
}

##########################
# Security Configuration #
##########################

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.resource_group}-nsg"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = chomp(data.http.ip_address.body)
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = chomp(data.http.ip_address.body)
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "sec_group" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

#############################
# Proximity Placement Group #
#############################

resource "azurerm_proximity_placement_group" "proximity-placement-group" {
  name                = "${var.resource_group}-proximity-placement-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

#################################
# Virtual Machine Configuration #
#################################

resource "azurerm_linux_virtual_machine" "vm" {
  count                           = var.numVMs
  name                            = "${var.resource_group}-vm-${count.index}"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  network_interface_ids           = [azurerm_network_interface.network_if[count.index].id]
  size                            = var.vmSize["small"]
  admin_username                  = var.username[0]
  disable_password_authentication = true
  proximity_placement_group_id    = azurerm_proximity_placement_group.proximity-placement-group.id
  tags                            = local.required_tags

  os_disk {
    name                 = "${var.resource_group}-disk-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = var.storageAccType
    disk_size_gb         = var.diskSize
  }

  source_image_reference {
    publisher = var.publisher
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.username[0]
    public_key = file("~/.ssh/id_rsa.pub")
  }

  connection {
    user        = var.username[0]
    host        = azurerm_public_ip.public_ip[count.index].ip_address
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = ["sudo apt update",
      "sudo apt install apache2 -y",
      "sudo echo \"<html><h1>My IP is $(curl -s http://ipv4.icanhazip.com)</h1></html>\" > index.html",
      "sudo mv index.html /var/www/html/",
    "sudo systemctl restart apache2"]
  }
}

