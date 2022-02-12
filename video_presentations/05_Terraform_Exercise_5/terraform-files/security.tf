resource "azurerm_network_security_group" "nsg" {
  depends_on          = [azurerm_resource_group.rg]
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
    source_address_prefix      = chomp(data.http.ip_address.body)
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "security-group-association" {
  for_each                  = var.resource_information
  network_interface_id      = azurerm_network_interface.network_interface[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}





