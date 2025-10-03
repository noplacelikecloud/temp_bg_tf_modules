# storage_accounts

This module provisions an Azure Storage Account with configurable replication, performance tier, account kind and HTTPS enforcement.  The module uses the latest `azurerm` provider (v4.47.0).

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
| name | Name of the Storage Account | `string` | n/a | yes |
| resource_group_name | Resource group in which to create the Storage Account | `string` | n/a | yes |
| location | Azure region for the Storage Account | `string` | `"westeurope"` | no |
| account_tier | Storage Account performance tier (Standard or Premium) | `string` | `"Standard"` | no |
| account_replication_type | Replication type for the Storage Account (e.g., LRS, GRS) | `string` | `"LRS"` | no |
| kind | The kind of storage account (e.g., StorageV2, BlobStorage) | `string` | `"StorageV2"` | no |
| enable_https_traffic_only | Whether to only allow HTTPS traffic to the Storage Account | `bool` | `true` | no |
| tags | Tags to assign to the Storage Account | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Storage Account |
| primary_connection_string | The primary connection string for the Storage Account |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->