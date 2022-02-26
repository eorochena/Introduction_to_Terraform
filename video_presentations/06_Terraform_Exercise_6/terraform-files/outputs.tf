output "resource_group_names" {
  value = [
    for resource_group_name in azurerm_resource_group.rg : resource_group_name.tags["environment"] 
  ]
}

output "tolist_example" {
  value = tolist([var.location])[0]
}
