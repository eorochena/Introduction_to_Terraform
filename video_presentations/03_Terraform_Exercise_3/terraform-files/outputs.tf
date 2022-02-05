########################
# Public IP Addressies #
########################

output "public_ip_address" {
  value = azurerm_public_ip.public_ip.*.ip_address
}

output "load_balancer_public_ip_address" {
  value = azurerm_public_ip.load_balancer_public_ip.ip_address
}

