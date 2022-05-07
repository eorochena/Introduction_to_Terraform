##################
# Resource Group #
##################

resource "azurerm_resource_group" "rg" {
  name     = format("%s-sample", var.name)
  location = var.location
}
