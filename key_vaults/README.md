# key_vaults

This module provisions an Azure Key Vault with configurable access policies, networking and SKU options.  It uses the latest `azurerm` provider (v4.47.0).

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
| name | Name of the Key Vault | `string` | n/a | yes |
| resource_group_name | Resource group name where the Key Vault will be created | `string` | n/a | yes |
| location | Azure region for the Key Vault | `string` | `"westeurope"` | no |
| tenant_id | Tenant ID for the Key Vault | `string` | n/a | yes |
| sku_name | SKU name (standard or premium) | `string` | `"standard"` | no |
| soft_delete_enabled | Enable soft delete | `bool` | `true` | no |
| purge_protection_enabled | Enable purge protection | `bool` | `false` | no |
| public_network_access_enabled | Whether public network access is allowed | `bool` | `true` | no |
| enabled_for_deployment | Whether Azure VMs can be deployed with certificates from the vault | `bool` | `false` | no |
| enabled_for_disk_encryption | Whether Azure Disk Encryption is enabled | `bool` | `false` | no |
| enabled_for_template_deployment | Whether the key vault is enabled for ARM template deployment | `bool` | `false` | no |
| access_policies | List of access policy objects | <pre>list(object({
  tenant_id = string
  object_id = string
  key_permissions         = optional(list(string))
  secret_permissions      = optional(list(string))
  certificate_permissions = optional(list(string))
  storage_permissions     = optional(list(string))
}))</pre> | `[]` | no |
| tags | Tags to assign to the Key Vault | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | The ID of the Key Vault |
| vault_uri | The URI of the Key Vault |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->