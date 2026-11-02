terraform {
  required_version = ">= 1.5.0, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.81.0, < 5.0.0"
    }
  }
}

resource "azurerm_public_ip" "public_ips" {

  for_each = var.public_ips

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  allocation_method = each.value.allocation_method
  sku               = each.value.sku
}
