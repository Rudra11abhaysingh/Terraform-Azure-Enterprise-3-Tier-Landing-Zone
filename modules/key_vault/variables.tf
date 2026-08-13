variable "key_vaults" {
  type = map(object({
    name                       = string
    location                   = string
    resource_group_name        = string
    tenant_id                  = string
    sku_name                   = string
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
  }))
}