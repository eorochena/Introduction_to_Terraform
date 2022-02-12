locals {
  required_tags = {
    owner               = var.labels["owner"]
    subscription        = var.labels["subscription"]
    market              = var.labels["market"]
    resource_group_type = var.labels["resource_group_type"]
  }
}

