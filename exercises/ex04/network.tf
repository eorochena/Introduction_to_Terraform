resource "azurerm_virtual_network" "vnet" {
  for_each = var.resource_information
    name = each.key
    location = each.value
    resource_group_name = each.key
    address_space = ["10.0.0.0/8"]
}

resource "azurerm_subnet" "subnet" {
  for_each = var.resource_information
    name = each.key
    resource_group_name = each.key
    virtual_network_name = each.key
    address_prefixes = each.key == "production" ? [var.subnets["production"]] : [var.subnets["development"]]
}

resource "azurerm_public_ip" "public_ip" {
  for_each = var.resource_information
    name = each.key
    resource_group_name = each.key
    location = each.value
    allocation_method = "Dynamic"
}



