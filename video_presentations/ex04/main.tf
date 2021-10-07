locals {
  required_tags = {
    environment         = var.labels["environment"]
    subscription        = var.labels["subscription"]
    market              = var.labels["market"]
    resource_group_type = var.labels["resource_group_type"]
  }
}

resource "azurerm_resource_group" "rg" {
  for_each = var.resource_information
  name     = each.key
  location = each.value
  tags     = local.required_tags
}

