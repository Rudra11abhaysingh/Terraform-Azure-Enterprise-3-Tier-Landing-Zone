output "key_vault_ids" {
  value = {
    for key, vault in azurerm_key_vault.kv :
    key => vault.id
  }
}
