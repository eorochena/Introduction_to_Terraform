###################
# Local Variables #
###################

locals {
  required_tags = {
    environment = var.labels["environment"]
    subscription = var.labels["subscription"]
    market = var.labels["market"]
    resource_group_type = var.labels["resource_group_type"]
  }
}

##################
# Resource Group #
##################

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.region

  tags = local.required_tags
}

