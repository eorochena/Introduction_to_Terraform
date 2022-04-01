resource "azurerm_linux_virtual_machine" "vm" {
  for_each                        = var.vmSize
  name                            = each.key
  location                        = var.location
  resource_group_name             = var.resource_name
  network_interface_ids           = [azurerm_network_interface.network_interface[each.key].id]
  size                            = each.value
  admin_username                  = var.username[1]
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
    username   = var.username[1]
    public_key = file("~/.ssh/id_rsa.pub")
  }
}
