variable "vnet_names" {
  description = "Map of Virtual Networks"

  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}