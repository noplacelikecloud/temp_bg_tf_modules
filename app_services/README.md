# app_services

This module provisions an Azure App Service (Web App) and associates it with an existing App Service Plan.  It exposes variables to configure HTTPS-only mode, client affinity, site configuration, application settings and tags.  The module uses the latest `azurerm` provider (v4.47.0).

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
| name | Name of the App Service (web app) | `string` | n/a | yes |
| resource_group_name | Resource group where the App Service will be created | `string` | n/a | yes |
| location | Azure region for the App Service | `string` | `"westeurope"` | no |
| app_service_plan_id | ID of the App Service Plan to associate with this app | `string` | n/a | yes |
| https_only | Whether the App Service should enforce HTTPS only | `bool` | `true` | no |
| client_affinity_enabled | Whether to use client affinity (sticky sessions) | `bool` | `false` | no |
| site_config | App Service site configuration | <pre>object({
  always_on     = optional(bool)
  ftps_state    = optional(string)
  http2_enabled = optional(bool)
})</pre> | `{ always_on = true, ftps_state = "Disabled", http2_enabled = false }` | no |
| app_settings | Map of application settings for the App Service | `map(string)` | `{}` | no |
| tags | Tags to assign to the App Service | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the App Service |
| default_site_hostname | The default hostname of the App Service |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->