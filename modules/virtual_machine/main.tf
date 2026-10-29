data "azurerm_network_interface" "nic" {
  for_each            = var.vm_names
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_linux_virtual_machine" "vm" {
  for_each              = var.vm_names
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [data.azurerm_network_interface.nic[each.key].id]
  size                  = each.value.vm_size

  os_disk {
    name                 = "${each.value.name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
}
