# peering

This module creates an Azure Virtual Network peering between two virtual networks.  It exposes options to configure access, forwarded traffic and gateway transit, and uses the latest `azurerm` provider (v4.47.0).

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
| name | Name of the virtual network peering | `string` | n/a | yes |
| resource_group_name | Resource group of the virtual network | `string` | n/a | yes |
| virtual_network_name | Name of the local virtual network | `string` | n/a | yes |
| remote_virtual_network_id | ID of the remote virtual network | `string` | n/a | yes |
| allow_virtual_network_access | Whether to allow virtual network access across the peering | `bool` | `true` | no |
| allow_forwarded_traffic | Whether forwarded traffic from the VMs in the peered network is allowed | `bool` | `false` | no |
| allow_gateway_transit | Whether gateway links can be used in the remote virtual network | `bool` | `false` | no |
| use_remote_gateways | Whether the peering will use the remote virtual network's gateway | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the virtual network peering |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->