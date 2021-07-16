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
    source_address_prefix      = "<your-ip-address>"
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
    source_address_prefix      = "<your-ip-address>"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "sec_group" {
  count                     = var.numVMs
  network_interface_id      = azurerm_network_interface.network_if[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

