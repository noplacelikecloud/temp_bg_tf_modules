# app_service_plan

This module provisions an Azure App Service Plan (also known as a Service Plan).  It allows you to configure the SKU, OS type, worker count and tags, and uses the latest `azurerm` provider (v4.47.0).

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
| name | Name of the App Service Plan | `string` | n/a | yes |
| resource_group_name | Resource group where the App Service Plan will be created | `string` | n/a | yes |
| location | Azure region for the App Service Plan | `string` | `"westeurope"` | no |
| os_type | Operating system type (Windows or Linux) | `string` | `"Windows"` | no |
| sku_name | SKU name for the App Service Plan | `string` | `"B1"` | no |
| worker_count | Number of workers for the plan | `number` | `1` | no |
| tags | Tags to assign to the App Service Plan | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the App Service Plan |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->