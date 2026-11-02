terraform {
  required_version = ">= 1.5.0, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.81.0, < 5.0.0"
    }
  }
}

resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion.name
  location            = var.bastion.location
  resource_group_name = var.bastion.resource_group_name
  sku                 = "Standard"

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.public_ip_id
  }
}
