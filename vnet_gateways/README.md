<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.47.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.47.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_network_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway) | resource |
| [azurerm_virtual_network_gateway_connection.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | Whether this VPN gateway is active-active | `bool` | `false` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | Enable BGP on the gateway | `bool` | `false` | no |
| <a name="input_generation"></a> [generation](#input\_generation) | The generation of the gateway (Generation1 or Generation2) | `string` | `"Generation1"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | Name for the IP configuration block | `string` | `"vnetGatewayConfig"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for the gateway | `string` | `"westeurope"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Virtual Network Gateway | `string` | n/a | yes |
| <a name="input_public_ip_address_id"></a> [public\_ip\_address\_id](#input\_public\_ip\_address\_id) | The ID of the public IP address to associate with the gateway | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group where the gateway will be created | `string` | n/a | yes |
| <a name="input_s2s_connections"></a> [s2s\_connections](#input\_s2s\_connections) | List of site‑to‑site VPN connections to create for this gateway. Each object may specify `local_network_gateway_id` or `peer_virtual_network_gateway_id` along with connection properties. | <pre>list(object({<br/>    name                            = string<br/>    connection_type                 = string<br/>    shared_key                      = string<br/>    local_network_gateway_id        = optional(string)<br/>    peer_virtual_network_gateway_id = optional(string)<br/>    enable_bgp                      = optional(bool)<br/>    ipsec_policy = optional(object({<br/>      dh_group         = string<br/>      ike_encryption   = string<br/>      ike_integrity    = string<br/>      ipsec_encryption = string<br/>      ipsec_integrity  = string<br/>      pfs_group        = string<br/>      sa_lifetime      = number<br/>      sa_data_size     = number<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the gateway | `string` | `"VpnGw1"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the subnet where the gateway will be placed (GatewaySubnet) | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to assign to the Virtual Network Gateway | `map(string)` | `{}` | no |
| <a name="input_type"></a> [type](#input\_type) | The type of gateway (Vpn or ExpressRoute) | `string` | `"Vpn"` | no |
| <a name="input_vpn_client_configuration"></a> [vpn\_client\_configuration](#input\_vpn\_client\_configuration) | VPN client configuration for point‑to‑site connectivity. When set to null no point‑to‑site configuration is added. See the README for schema details. | `any` | `null` | no |
| <a name="input_vpn_type"></a> [vpn\_type](#input\_vpn\_type) | The VPN type (PolicyBased or RouteBased) | `string` | `"RouteBased"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Virtual Network Gateway |
| <a name="output_s2s_connection_ids"></a> [s2s\_connection\_ids](#output\_s2s\_connection\_ids) | IDs of the site‑to‑site VPN connections created by this module, keyed by connection name |
<!-- END_TF_DOCS -->