data "azurerm_public_ip" "pip" {

  for_each = var.load_balancers

  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name

}
resource "azurerm_lb" "lb" {

  for_each = var.load_balancers

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku

  frontend_ip_configuration {

    name                 = "frontend"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id

  }

}