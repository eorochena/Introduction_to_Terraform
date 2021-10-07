resource "azurerm_network_security_group" "nsg" {
  for_each            = var.resource_information
  name                = each.key
  resource_group_name = each.key
  location            = each.value

  security_rule {
    name                       = "${each.key}-SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "209.243.55.0/24"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "security-group-association" {
  for_each                  = var.resource_information
  network_interface_id      = azurerm_network_interface.network_interface[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}





