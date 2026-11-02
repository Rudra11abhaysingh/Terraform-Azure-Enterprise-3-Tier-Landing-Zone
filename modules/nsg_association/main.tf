terraform {
  required_version = ">= 1.5.0, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.81.0, < 5.0.0"
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_associations" {
  for_each = var.nsg_associations

  subnet_id                 = var.subnet_ids[each.value.subnet_key]
  network_security_group_id = var.nsg_ids[each.value.nsg_key]
}
