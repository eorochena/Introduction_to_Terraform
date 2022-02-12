output "public_ip_address" {
  value = {
    for name, ip_address in azurerm_public_ip.public_ip : name => ip_address["ip_address"]
  }
}
