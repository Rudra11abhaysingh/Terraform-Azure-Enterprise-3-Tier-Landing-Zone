output "bastion_id" {
  description = "Azure Bastion Host resource ID"
  value       = azurerm_bastion_host.bastion.id
}

output "bastion_name" {
  description = "Azure Bastion Host name"
  value       = azurerm_bastion_host.bastion.name
}
