# postgresql_flexible

This module provisions an Azure PostgreSQL Flexible Server.  It exposes variables to configure the SKU, storage, backup retention and network accessibility.  The module uses the latest `azurerm` provider (v4.47.0).

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
| name | Name of the PostgreSQL Flexible Server | `string` | n/a | yes |
| resource_group_name | Resource group where the PostgreSQL Flexible Server will be created | `string` | n/a | yes |
| location | Azure region for the PostgreSQL Flexible Server | `string` | `"westeurope"` | no |
| administrator_login | Administrator login name | `string` | `"psqladmin"` | no |
| administrator_password | Administrator password (sensitive) | `string` | n/a | yes |
| sku_name | SKU name for the PostgreSQL Flexible Server | `string` | `"GP_Standard_D2s_v3"` | no |
| version | PostgreSQL version | `string` | `"15"` | no |
| storage_mb | Storage size in megabytes | `number` | `32768` | no |
| backup_retention_days | Backup retention in days | `number` | `7` | no |
| geo_redundant_backup_enabled | Enable geo-redundant backups | `bool` | `false` | no |
| public_network_access_enabled | Whether public network access is enabled | `bool` | `true` | no |
| tags | Tags to assign to the PostgreSQL Flexible Server | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the PostgreSQL Flexible Server |
| fully_qualified_domain_name | The fully qualified domain name of the PostgreSQL Flexible Server |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->