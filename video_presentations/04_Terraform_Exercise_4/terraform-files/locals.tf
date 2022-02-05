locals {
  required_tags = {
    environment         = var.labels["environment"]
    subscription        = var.labels["subscription"]
    market              = var.labels["market"]
    resource_group_type = var.labels["resource_group_type"]
  }
}

