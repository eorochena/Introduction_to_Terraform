output "resource_group_names" {
  value = [
    for resource_group_name in azurerm_resource_group.rg : resource_group_name.tags["environment"] 
  ]
}
