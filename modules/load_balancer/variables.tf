variable "load_balancers" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    sku                 = string
    public_ip_name      = string
  }))
}