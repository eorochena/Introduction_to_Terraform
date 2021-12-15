resource "azurerm_public_ip" "load_balancer_public_ip" {
  name                = "${var.resource_group}-load_balancer-public-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}

resource "azurerm_lb" "load_balancer" {
  name                = "${var.resource_group}-load-balancer"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                          = "PublicIPAddress"
    public_ip_address_id          = azurerm_public_ip.load_balancer_public_ip.id
    subnet_id                     = azurerm_subnet.subnet.id
    availability_zone             = "Zone-Redundant"
  }
}

resource "azurerm_lb_backend_address_pool" "backend_address_pool" {
  loadbalancer_id = azurerm_lb.load_balancer.id
  name            = "WebServerAddressPool"
}

resource "azurerm_network_interface_backend_address_pool_association" "interface_association" {
  count                   = var.numVms
  network_interface_id    = azurerm_network_interface.network_if[count.index].id
  ip_configuration_name   = "${var.resource_group}-ip-conf"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_address_pool.id
}

resource "azurerm_lb_rule" "lb_rules" {
  resource_group_name            = azurerm_resource_group.rg.name
  loadbalancer_id                = azurerm_lb.load_balancer.id
  name                           = "LB_WebServer"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.backend_address_pool.id]
}

resource "azurerm_lb_probe" "lb_probe" {
  resource_group_name = azurerm_resource_group.rg.name
  loadbalancer_id     = azurerm_lb.load_balancer.id
  name                = "http-health-check"
  port                = 80
  interval_in_seconds = 3
  number_of_probes    = 3
}
