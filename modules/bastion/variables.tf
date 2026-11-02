variable "bastion" {
  description = "Azure Bastion configuration"

  type = object({
    name                 = string
    location             = string
    resource_group_name  = string
    virtual_network_name = string
    public_ip_name       = string
  })
}

variable "subnet_id" {
  description = "AzureBastionSubnet resource ID"
  type        = string
}

variable "public_ip_id" {
  description = "Bastion Public IP resource ID"
  type        = string
}
