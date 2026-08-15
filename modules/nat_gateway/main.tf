resource "azurerm_nat_gateway" "nat" {
  for_each = var.nat_gateways

  name                    = each.value.name
  location                = each.value.location
  resource_group_name     = each.value.resource_group_name
  sku_name                = each.value.sku_name
  idle_timeout_in_minutes = each.value.idle_timeout_in_minutes
}
data "azurerm_public_ip" "pip" {
  for_each = var.nat_gateways

  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_nat_gateway_public_ip_association" "pip" {
  for_each = var.nat_gateways

  nat_gateway_id       = azurerm_nat_gateway.nat[each.key].id
  public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
}
data "azurerm_subnet" "app" {
  for_each = var.nat_gateways

  name                 = "snet-app"
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = "vnet-dev-001"
}
resource "azurerm_subnet_nat_gateway_association" "nat" {
  for_each = var.nat_gateways

  subnet_id      = data.azurerm_subnet.app[each.key].id
  nat_gateway_id = azurerm_nat_gateway.nat[each.key].id
}