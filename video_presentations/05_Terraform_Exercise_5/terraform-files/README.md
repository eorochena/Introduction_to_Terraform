## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | = 2.91.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | = 2.91.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_availability_set.availability-set](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/availability_set) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.network_interface](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.security-group-association](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.91.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acc_net"></a> [acc\_net](#input\_acc\_net) | accelerated network | `bool` | n/a | yes |
| <a name="input_diskSize"></a> [diskSize](#input\_diskSize) | disk | `number` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | labels | `map(any)` | n/a | yes |
| <a name="input_offer"></a> [offer](#input\_offer) | offer | `string` | n/a | yes |
| <a name="input_osVersion"></a> [osVersion](#input\_osVersion) | os | `string` | n/a | yes |
| <a name="input_publisher"></a> [publisher](#input\_publisher) | publisher | `string` | n/a | yes |
| <a name="input_resource_information"></a> [resource\_information](#input\_resource\_information) | resource | `map(any)` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | sku | `string` | n/a | yes |
| <a name="input_storageAccType"></a> [storageAccType](#input\_storageAccType) | acct | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | subnets | `map(any)` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | user | `list(any)` | n/a | yes |
| <a name="input_vmSize"></a> [vmSize](#input\_vmSize) | sizes | `map(any)` | n/a | yes |

## Outputs

No outputs.
