variable "rg_names" {

}
variable "vnet_names" {
  description = "Map of Virtual Networks"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}
variable "subnet_names" {
  description = "Map of Subnets"

  type = map(object({
    name                 = string
    resource_group_name  = string
    virtual_network_name = string
    address_prefixes     = list(string)
  }))
}
variable "nsgs" {
  description = "Map of Network Security Groups"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}
variable "nsg_associations" {
  description = "Map of NSG associations"

  type = map(object({
    subnet_key = string
    nsg_key    = string
  }))
}
variable "public_ips" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    sku                 = string
  }))
}
variable "nic_names" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    ip_configuration = object({
      name                          = string
      subnet_key                    = string
      subnet_name                   = string
      virtual_network_name          = string
      private_ip_address_allocation = string
      public_ip_key                 = string
    })
  }))
}
variable "vm_names" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    vm_size             = string
    nic_name            = string
    admin_username      = string
    admin_password      = string
  }))
}
variable "load_balancers" {

  type = map(object({

    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    public_ip_name      = string
    backend_nic_name    = string
  }))

}
variable "nat_gateways" {
  type = map(object({
    name                    = string
    location                = string
    resource_group_name     = string
    sku_name                = string
    idle_timeout_in_minutes = number
    public_ip_name          = string
  }))
}
variable "route_tables" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    subnet_name          = string
    virtual_network_name = string
  }))
}
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
variable "storage_accounts" {
  type = map(object({
    name                       = string
    resource_group_name        = string
    location                   = string
    account_tier               = string
    account_replication_type   = string
    min_tls_version            = string
    https_traffic_only_enabled = bool
  }))
}
variable "managed_disks" {
  type = map(object({
    name                 = string
    location             = string
    resource_group_name  = string
    storage_account_type = string
    create_option        = string
    disk_size_gb         = number
    vm_name              = string
    lun                  = number
  }))
}
