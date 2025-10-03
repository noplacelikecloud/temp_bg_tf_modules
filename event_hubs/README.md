# event_hubs

This module provisions an Azure Event Hub namespace along with optional Event Hubs and consumer groups.  It exposes variables to configure the namespace SKU, capacity, auto-inflate and the Event Hubs themselves.  The module uses the latest `azurerm` provider (v4.47.0).

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
| name | Name of the Event Hub namespace | `string` | n/a | yes |
| resource_group_name | Resource group where the Event Hub namespace will be created | `string` | n/a | yes |
| location | Azure region for the Event Hub namespace | `string` | `"westeurope"` | no |
| sku | SKU for the Event Hub namespace | `string` | `"Standard"` | no |
| capacity | Throughput units for the namespace | `number` | `1` | no |
| auto_inflate_enabled | Whether auto-inflate is enabled | `bool` | `false` | no |
| maximum_throughput_units | Maximum throughput units when auto-inflate is enabled | `number` | `0` | no |
| eventhubs | List of Event Hubs to create in the namespace | <pre>list(object({
  name            = string
  partition_count = optional(number)
  message_retention = optional(number)
  consumer_groups  = optional(list(string))
}))</pre> | `[]` | no |
| tags | Tags to assign to the Event Hub namespace | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| namespace_id | The ID of the Event Hub namespace |
| namespace_name | The name of the Event Hub namespace |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->