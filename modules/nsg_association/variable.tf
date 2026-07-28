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