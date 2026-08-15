resource "azurerm_route_table" "route" {
  for_each = var.route_tables

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_route" "default" {
  for_each = var.route_tables

  name                = "default-route"
  resource_group_name = each.value.resource_group_name
  route_table_name    = azurerm_route_table.route[each.key].name
  address_prefix      = "0.0.0.0/0"
  next_hop_type       = "Internet"
}
data "azurerm_subnet" "subnet" {
  for_each = var.route_tables

  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

resource "azurerm_subnet_route_table_association" "association" {
  for_each = var.route_tables

  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  route_table_id = azurerm_route_table.route[each.key].id
}
resource "azurerm_route" "vnet" {
  for_each = var.route_tables

  name                = "vnet-local-route"
  resource_group_name = each.value.resource_group_name
  route_table_name    = azurerm_route_table.route[each.key].name

  address_prefix = "10.0.0.0/16"
  next_hop_type  = "VnetLocal"
}