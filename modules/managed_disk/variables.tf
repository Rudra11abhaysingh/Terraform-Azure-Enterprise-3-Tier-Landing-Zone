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
variable "vm_ids" {
  type = map(string)
}
