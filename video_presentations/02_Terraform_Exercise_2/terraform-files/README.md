## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | = 2.75.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | = 2.75.0 |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/2.75.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.network_if](https://registry.terraform.io/providers/hashicorp/azurerm/2.75.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.sec_group](https://registry.terraform.io/providers/hashicorp/azurerm/2.75.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/2.75.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.public_ip](https://registry.terraform.io/providers/hashicorp/azurerm/2.75.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/2.75.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.75.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/2.75.0/docs/resources/virtual_network) | resource |
| [http_http.ip_address](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_password_authentication"></a> [disable\_password\_authentication](#input\_disable\_password\_authentication) | password authentication | `bool` | n/a | yes |
| <a name="input_diskSize"></a> [diskSize](#input\_diskSize) | storage size | `number` | n/a | yes |
| <a name="input_numVMs"></a> [numVMs](#input\_numVMs) | number of virtual machines | `number` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Azure region | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | Resource Group Name | `string` | n/a | yes |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | storage account type | `list(any)` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | Admin user | `list(any)` | n/a | yes |
| <a name="input_vmSize"></a> [vmSize](#input\_vmSize) | Azure VM series | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | n/a |
