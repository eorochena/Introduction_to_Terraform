resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.resource_information
  name                            = each.key
  location                        = each.value
  resource_group_name             = each.key
  network_interface_ids           = [azurerm_network_interface.network_interface[each.key].id]
  size                            = var.labels["environment"] == "production" ? var.vmSize["production"] : var.vmSize["development"]
  admin_username                  = var.username[0]
  disable_password_authentication = true

  tags = local.required_tags

  os_disk {
    name                 = each.key
    caching              = "ReadWrite"
    disk_size_gb         = var.diskSize
    storage_account_type = var.storageAccType
  }

  source_image_reference {
    publisher = var.publisher
    offer     = var.offer
    sku       = var.sku
    version   = var.osVersion
  }

  admin_ssh_key {
    username   = var.username[0]
    public_key = file("~/.ssh/id_rsa.pub")
  }
}
