##################
# Resource Group #
##################

module "resource_group" {
  source         = "git@github.com:eorochena/resource_group.git?ref=v1.0.1"
  name = format("%s-data", var.resource_group)
  location       = var.location
}

