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