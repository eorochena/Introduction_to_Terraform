resource "azurerm_resource_group" "rg" {
  for_each = var.resource_information
  name     = each.key
  location = each.value
  tags     = local.required_tags
}

