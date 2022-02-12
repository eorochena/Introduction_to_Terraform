output "public_ip_address" {
  for_each = var.resource_information
  value = azurerm_public_ip.public_ip[each.key].*.ip_address
}
