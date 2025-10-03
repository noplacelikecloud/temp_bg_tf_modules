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
| [azurerm_virtual_network_peering.hub_to_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.spoke_to_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Whether forwarded traffic from the VMs in the peered network is allowed | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Whether gateway transit is allowed across the peering | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Whether to allow virtual network access across the peering | `bool` | `true` | no |
| <a name="input_hub_peering_name"></a> [hub\_peering\_name](#input\_hub\_peering\_name) | Name for the hub‑to‑spoke peering resource | `string` | `"hub-to-spoke"` | no |
| <a name="input_hub_resource_group_name"></a> [hub\_resource\_group\_name](#input\_hub\_resource\_group\_name) | Resource group name of the hub virtual network | `string` | n/a | yes |
| <a name="input_hub_virtual_network_id"></a> [hub\_virtual\_network\_id](#input\_hub\_virtual\_network\_id) | Resource ID of the hub virtual network | `string` | n/a | yes |
| <a name="input_hub_virtual_network_name"></a> [hub\_virtual\_network\_name](#input\_hub\_virtual\_network\_name) | Name of the hub virtual network | `string` | n/a | yes |
| <a name="input_spoke_peering_name"></a> [spoke\_peering\_name](#input\_spoke\_peering\_name) | Name for the spoke‑to‑hub peering resource | `string` | `"spoke-to-hub"` | no |
| <a name="input_spoke_resource_group_name"></a> [spoke\_resource\_group\_name](#input\_spoke\_resource\_group\_name) | Resource group name of the spoke virtual network | `string` | n/a | yes |
| <a name="input_spoke_virtual_network_id"></a> [spoke\_virtual\_network\_id](#input\_spoke\_virtual\_network\_id) | Resource ID of the spoke virtual network | `string` | n/a | yes |
| <a name="input_spoke_virtual_network_name"></a> [spoke\_virtual\_network\_name](#input\_spoke\_virtual\_network\_name) | Name of the spoke virtual network | `string` | n/a | yes |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Whether the peering will use the remote virtual network's gateway | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hub_to_spoke_id"></a> [hub\_to\_spoke\_id](#output\_hub\_to\_spoke\_id) | The ID of the hub‑to‑spoke virtual network peering |
| <a name="output_spoke_to_hub_id"></a> [spoke\_to\_hub\_id](#output\_spoke\_to\_hub\_id) | The ID of the spoke‑to‑hub virtual network peering |
<!-- END_TF_DOCS -->