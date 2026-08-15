data "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "bastion" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
}
resource "azurerm_bastion_host" "bastion" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                 = "bastion-ip-config"
    subnet_id            = data.azurerm_subnet.bastion.id
    public_ip_address_id = data.azurerm_public_ip.bastion.id
  }
}