resource "azurerm_lb" "azure-lb" {
 name                = "${var.resource_group}-lb"
 resource_group_name = azurerm_resource_group.rg.name
 location            = azurerm_resource_group.rg.location
 
 frontend_ip_configuration {
   name                 = "public_ip"
   public_ip_address_id = azurerm_public_ip.public_ip.id
 }
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
 resource_group_name = azurerm_resource_group.rg.name
 loadbalancer_id     = azurerm_lb.azure-lb.id
 name                = "backend_pool"
}

resource "azurerm_lb_probe" "lb_probe" {
 resource_group_name = azurerm_resource_group.rg.name
 loadbalancer_id     = azurerm_lb.azure-lb.id
 name                = "http"
 port                = "80"
}

resource "azurerm_lb_rule" "lb-rule" {
 resource_group_name = azurerm_resource_group.rg.name
 loadbalancer_id     = azurerm_lb.azure-lb.id
   name                           = "http"
   protocol                       = "Tcp"
   frontend_port                  = "80"
   backend_port                   = "80"
   backend_address_pool_id        = azurerm_lb_backend_address_pool.backend_pool.id
   frontend_ip_configuration_name = "public_ip"
   probe_id                       = azurerm_lb_probe.lb_probe.id
}

