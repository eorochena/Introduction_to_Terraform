######################
# Configure Provider #
######################

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.46.0"
    }
  }
}

############
# Provider #
############

provider "azurerm" {
  features {}
}

##################
# Resource Group #
##################

resource "azurerm_resource_group" "rg" {
  name     = "eduardo-rg"
  location = "eastus2"
}

#########################
# Network Configuration #
#########################

resource "azurerm_virtual_network" "vnet" {
  name                = "eduardo-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "eduardo-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "eduardo-public-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "network_if" {
  name                = "eduardo-if"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  ip_configuration {
    name                          = "eduardo-ip-conf"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

##########################
# Security Configuration #
##########################

resource "azurerm_network_security_group" "nsg" {
  name                = "eduardo-nsg"
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
    source_address_prefix      = "<your-ip-address>"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "sec_group" {
  network_interface_id      = azurerm_network_interface.network_if.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

#################################
# Virtual Machine Configuration #
#################################

resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "eduardo-vm"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  network_interface_ids           = [azurerm_network_interface.network_if.id]
  size                            = "Standard_L8s_v2"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  os_disk {
    name                 = "eduardo-disk"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }
}

