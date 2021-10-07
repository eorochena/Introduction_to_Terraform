resource "azurerm_virtual_network" "vnet" {
  for_each            = var.resource_information
  name                = each.key
  location            = each.value
  resource_group_name = each.key
  address_space       = ["10.0.0.0/8"]
}

resource "azurerm_subnet" "subnet" {
  for_each             = var.resource_information
  name                 = each.key
  resource_group_name  = each.key
  virtual_network_name = each.key
  address_prefixes     = each.key == "production" ? [var.subnets["production"]] : [var.subnets["development"]]
}

resource "azurerm_public_ip" "public_ip" {
  for_each            = var.resource_information
  name                = each.key
  resource_group_name = each.key
  location            = each.value
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "network_interface" {
  for_each            = var.resource_information
  name                = each.key
  resource_group_name = each.key
  location            = each.value

  ip_configuration {
    name                          = "${each.key}-ip-conf"
    subnet_id                     = azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
  }
}




