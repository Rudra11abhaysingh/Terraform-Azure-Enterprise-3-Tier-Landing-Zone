resource "azurerm_managed_disk" "disk" {
  for_each = var.managed_disks

  name                 = each.value.name
  location             = each.value.location
  resource_group_name  = each.value.resource_group_name
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
}
resource "azurerm_virtual_machine_data_disk_attachment" "attachment" {
  for_each = var.managed_disks

  managed_disk_id    = azurerm_managed_disk.disk[each.key].id
  virtual_machine_id = var.vm_ids[each.value.vm_name]
  lun                = each.value.lun
  caching            = "ReadWrite"
}
