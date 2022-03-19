resource "azurerm_virtual_network" "vnet" {
  depends_on          = [azurerm_resource_group.rg]
  name                = "${var.resource_name}-vnet"
  location            = var.location
  resource_group_name = var.resource_name
  address_space       = ["10.0.0.0/8"]
}

resource "azurerm_subnet" "subnet" {
  depends_on           = [azurerm_resource_group.rg, azurerm_virtual_network.vnet]
  name                 = "${var.resource_name}-subnet"
  resource_group_name  = var.resource_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  depends_on          = [azurerm_resource_group.rg]
  for_each            = var.vmSize
  name                = each.key
  resource_group_name = var.resource_name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "network_interface" {
  depends_on                    = [azurerm_resource_group.rg]
  for_each                      = var.vmSize
  name                          = "${each.key}-interface"
  resource_group_name           = var.resource_name
  location                      = var.location
  enable_accelerated_networking = var.acc_net

  ip_configuration {
    name                          = "${each.key}-ip-conf"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[each.key].id
  }
}




