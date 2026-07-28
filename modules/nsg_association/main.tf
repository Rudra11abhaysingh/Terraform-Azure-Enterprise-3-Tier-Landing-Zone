
data "azurerm_subnet" "subnet" {
  for_each             = var.subnet_names
  name                 = each.value.name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_network_security_group" "nsg" {
  for_each            = var.nsgs
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_subnet_network_security_group_association" "nsg_associations" {
  for_each                  = var.nsg_associations
  subnet_id                 = data.azurerm_subnet.subnet[each.value.subnet_key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.value.nsg_key].id
}