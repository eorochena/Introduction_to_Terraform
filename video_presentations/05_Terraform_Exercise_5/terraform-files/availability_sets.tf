resource "azurerm_availability_set" "availability-set" {
  depends_on          = [azurerm_resource_group.rg]
  for_each            = var.resource_information
  name                = "${each.key}-availability"
  location            = each.value
  resource_group_name = each.key
  managed             = true
  tags                = local.required_tags
}
