# vnet_gateways

This module provisions an Azure Virtual Network Gateway (VPN or ExpressRoute).  It allows you to configure the VPN type, generation, SKU, BGP, active-active mode and assign a public IP and subnet.  The module uses the latest `azurerm` provider (v4.47.0).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| azurerm | ~> 4.47.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | ~> 4.47.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the Virtual Network Gateway | `string` | n/a | yes |
| resource_group_name | Resource group where the gateway will be created | `string` | n/a | yes |
| location | Azure region for the gateway | `string` | `"westeurope"` | no |
| type | The type of gateway (Vpn or ExpressRoute) | `string` | `"Vpn"` | no |
| vpn_type | The VPN type (PolicyBased or RouteBased) | `string` | `"RouteBased"` | no |
| generation | The generation of the gateway (Generation1 or Generation2) | `string` | `"Generation1"` | no |
| sku | The SKU of the gateway | `string` | `"VpnGw1"` | no |
| active_active | Whether this VPN gateway is active-active | `bool` | `false` | no |
| enable_bgp | Enable BGP on the gateway | `bool` | `false` | no |
| ip_configuration_name | Name for the IP configuration block | `string` | `"vnetGatewayConfig"` | no |
| public_ip_address_id | The ID of the public IP address to associate with the gateway | `string` | n/a | yes |
| subnet_id | The ID of the subnet where the gateway will be placed (GatewaySubnet) | `string` | n/a | yes |
| tags | Tags to assign to the Virtual Network Gateway | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Virtual Network Gateway |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->