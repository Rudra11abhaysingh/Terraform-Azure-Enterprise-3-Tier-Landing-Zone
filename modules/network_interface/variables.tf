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
