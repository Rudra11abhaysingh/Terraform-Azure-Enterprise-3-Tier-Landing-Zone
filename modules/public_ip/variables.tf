variable "public_ips" {
  description = "Map of Azure Public IP configurations"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))
}
