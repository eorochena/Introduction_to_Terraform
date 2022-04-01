resource "azurerm_network_security_group" "nsg" {
  depends_on          = [azurerm_resource_group.rg]
  name                = "${var.resource_name}-nsg"
  resource_group_name = var.resource_name
  location            = var.location

  security_rule {
    name                       = "${var.resource_name}-SSH"
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

resource "azurerm_subnet_network_security_group_association" "sec_group" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}






