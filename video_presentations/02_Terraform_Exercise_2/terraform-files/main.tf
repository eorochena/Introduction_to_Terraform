######################
# Configure Provider #
######################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.75.0"
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

##################
# Resource Group #
##################

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.region
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
}

resource "azurerm_network_interface" "network_if" {
  count               = var.numVMs
  name                = "${var.resource_group}-if-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

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
    name                       = "HTTPS"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = chomp(data.http.ip_address.body)
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "sec_group" {
  count                     = var.numVMs
  network_interface_id      = azurerm_network_interface.network_if[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
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
  disable_password_authentication = var.disable_password_authentication

  os_disk {
    name                 = "${var.resource_group}-disk-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = var.storage_account_type[0]
    disk_size_gb         = var.diskSize
  }

  source_image_reference {
    publisher = "Canonical"
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

  provisioner "file" {
    source      = "files/index.html"
    destination = "/home/${var.username[0]}/index.html"
  }

  provisioner "remote-exec" {
    inline = ["sudo apt update",
      "sudo apt install apache2 -y",
      "sudo mv /home/${var.username[0]}/index.html /var/www/html/",
    "sudo systemctl restart apache2"]
  }
}

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.*.ip_address
}

