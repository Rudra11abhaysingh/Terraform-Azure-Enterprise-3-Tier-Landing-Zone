terraform {
  required_version = ">= 1.5.0, < 2.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.81.0, < 5.0.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  for_each = var.rg_names
  name     = each.value.name
  location = each.value.location
}
