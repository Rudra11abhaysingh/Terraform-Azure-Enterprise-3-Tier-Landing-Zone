
data "azurerm_subnet" "subnet" {
  for_each = var.nic_names

  name                 = each.value.ip_configuration.subnet_name
  virtual_network_name = each.value.ip_configuration.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_network_interface" "nics" {
  for_each = var.nic_names

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation

  }

}