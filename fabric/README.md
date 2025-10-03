# fabric

This module provisions an Azure Service Fabric Cluster using the latest `azurerm` provider (v4.47.0).  It exposes configurable settings for the cluster, node types and tags.

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
| name | Name of the Service Fabric cluster | `string` | n/a | yes |
| resource_group_name | Resource group name for the cluster | `string` | n/a | yes |
| location | Azure region where the cluster will be created | `string` | `"westeurope"` | no |
| reliability_level | Reliability level (e.g., Bronze, Silver, Gold, Platinum) | `string` | `"Bronze"` | no |
| upgrade_mode | Upgrade mode (e.g., Manual, Automatic) | `string` | `"Manual"` | no |
| management_endpoint | Management endpoint URL for the cluster | `string` | n/a | yes |
| vm_image | VM image to use for the cluster | `string` | `"Windows"` | no |
| node_types | List of node type configurations | <pre>list(object({
  name                        = string
  instance_count              = number
  is_primary                  = bool
  client_endpoint_port        = number
  http_endpoint_port          = number
  durability_level            = optional(string)
  reverse_proxy_endpoint_port = optional(number)
  application_ports           = optional(list(object({
    start_port = number
    end_port   = number
  })))
  ephemeral_ports             = optional(list(object({
    start_port = number
    end_port   = number
  })))
}))</pre> | See `variables.tf` for default | no |
| tags | Tags to assign to the cluster | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Service Fabric cluster |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->