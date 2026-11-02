output "public_ip_ids" {
  description = "Map of Public IP resource IDs"

  value = {
    for key, public_ip in azurerm_public_ip.public_ips :
    key => public_ip.id
  }
}

output "public_ip_addresses" {
  description = "Map of Public IP addresses"

  value = {
    for key, public_ip in azurerm_public_ip.public_ips :
    key => public_ip.ip_address
  }
}
