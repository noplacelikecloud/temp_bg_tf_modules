# private_dns

This module creates an Azure Private DNS zone.  It exposes simple variables for the zone name, resource group and tags and uses the latest `azurerm` provider (v4.47.0).

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
| name | Name of the Private DNS zone | `string` | n/a | yes |
| resource_group_name | Resource group in which the Private DNS zone will be created | `string` | n/a | yes |
| tags | Tags to assign to the Private DNS zone | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Private DNS zone |
| name | The name of the Private DNS zone |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->