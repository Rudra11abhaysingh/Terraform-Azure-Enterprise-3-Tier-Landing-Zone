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
resource "azurerm_lb_backend_address_pool" "backend_pool" {

  for_each = var.load_balancers

  name            = "backend-pool"
  loadbalancer_id = azurerm_lb.lb[each.key].id
}
data "azurerm_network_interface" "backend_nic" {
  for_each = var.load_balancers

  name                = each.value.backend_nic_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_network_interface_backend_address_pool_association" "backend" {
  for_each = var.load_balancers

  network_interface_id    = data.azurerm_network_interface.backend_nic[each.key].id
  ip_configuration_name   = "ipconfig-app-dev-001"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool[each.key].id
}
resource "azurerm_lb_probe" "http" {
  for_each = var.load_balancers

  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = "http-probe"
  protocol        = "Http"
  port            = 80
  request_path    = "/"
}
resource "azurerm_lb_rule" "http" {
  for_each = var.load_balancers

  name                           = "http-rule"
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "frontend"

  backend_address_pool_ids = [
    azurerm_lb_backend_address_pool.backend_pool[each.key].id
  ]

  probe_id = azurerm_lb_probe.http[each.key].id
}