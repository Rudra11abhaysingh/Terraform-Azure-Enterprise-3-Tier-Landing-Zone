terraform {
  required_version = ">= 1.5.0, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.81.0, < 5.0.0"
    }
  }
}

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

  admin_username                  = each.value.admin_username
  disable_password_authentication = true
  allow_extension_operations      = false

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = each.value.admin_ssh_public_key
  }

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
}
