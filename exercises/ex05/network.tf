#########################
# Network Configuration #
#########################

resource "azurerm_virtual_network" "vnet" {
  name = "${var.resource_group}-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name = "${var.resource_group}-subnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  count = var.numVMs
  name = "${var.resource_group}-public-ip-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
}

resource "azurerm_network_interface" "network_if" {
  count = var.numVMs
  name = "${var.resource_group}-if-${count.index}"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  enable_accelerated_networking = var.acc_net

  ip_configuration {
    name = "${var.resource_group}-ip-conf"
    subnet_id = azurerm_subnet.subnet.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id = azurerm_public_ip.public_ip[count.index].id
  }
}

