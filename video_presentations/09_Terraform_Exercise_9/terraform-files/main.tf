##################
# Resource Group #
##################

/*
module "resource_group" {
  source         = "git@github.com:eorochena/resource_group.git?ref=v1.0.1"
  name = format("%s-data", var.resource_group)
  location       = var.location
}
*/

module "resource_group" {
  source         = "./modules"
  name = format("%s-data", var.resource_group)
  location       = var.location
}

/*
data "azurerm_resource_group" "rg" {
  name = var.resource_group
}

resource "azurerm_resource_group" "rg" {
  name     = format("%s-sample", var.resource_group)
  location = var.location
}
*/

