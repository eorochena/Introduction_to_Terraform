resource "azurerm_virtual_network" "vnet" {
  depends_on          = [azurerm_resource_group.rg]
  for_each            = var.resource_information
  name                = each.key
  location            = each.value
  resource_group_name = each.key
  address_space       = ["10.0.0.0/8"]
}

resource "azurerm_subnet" "subnet" {
  depends_on           = [azurerm_resource_group.rg, azurerm_virtual_network.vnet]
  for_each             = var.resource_information
  name                 = each.key
  resource_group_name  = each.key
  virtual_network_name = each.key
  address_prefixes     = each.key == "production" ? [var.subnets["production"]] : [var.subnets["development"]]
}

resource "azurerm_public_ip" "public_ip" {
  depends_on          = [azurerm_resource_group.rg]
  for_each            = var.resource_information
  name                = each.key
  resource_group_name = each.key
  location            = each.value
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "network_interface" {
  depends_on                    = [azurerm_resource_group.rg]
  for_each                      = var.resource_information
  name                          = each.key
  resource_group_name           = each.key
  location                      = each.value
  enable_accelerated_networking = var.acc_net

  ip_configuration {
    name                          = "${each.key}-ip-conf"
    subnet_id                     = azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
  }
}




