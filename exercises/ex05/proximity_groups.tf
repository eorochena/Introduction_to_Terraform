#############################
# Proximity Placement Group #
#############################

resource "azurerm_proximity_placement_group" "proximity-placement-group" {
  name                = "${var.resource_group}-proximity-placement-group"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

