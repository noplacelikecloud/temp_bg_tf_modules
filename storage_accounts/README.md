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
| [azurerm_storage_account.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_storage_queue.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue) | resource |
| [azurerm_storage_share.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_share) | resource |
| [azurerm_storage_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_replication_type"></a> [account\_replication\_type](#input\_account\_replication\_type) | Replication type for the Storage Account (e.g., LRS, GRS) | `string` | `"LRS"` | no |
| <a name="input_account_tier"></a> [account\_tier](#input\_account\_tier) | Storage Account performance tier (Standard or Premium) | `string` | `"Standard"` | no |
| <a name="input_blob_containers"></a> [blob\_containers](#input\_blob\_containers) | List of blob containers to create within the storage account. Each object should include a `name` and optional `container_access_type` (private, blob or container). | <pre>list(object({<br/>    name                  = string<br/>    container_access_type = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_enable_https_traffic_only"></a> [enable\_https\_traffic\_only](#input\_enable\_https\_traffic\_only) | Whether to only allow HTTPS traffic to the Storage Account | `bool` | `true` | no |
| <a name="input_file_shares"></a> [file\_shares](#input\_file\_shares) | List of file shares to create. Each object must include a `name` and may include `quota` in GB, `access_tier` (Hot or Cool), and `enabled_protocols` (SMB, NFS or both). | <pre>list(object({<br/>    name              = string<br/>    quota             = optional(number)<br/>    access_tier       = optional(string)<br/>    enabled_protocols = optional(string)<br/>  }))</pre> | `[]` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | The kind of storage account (e.g., StorageV2, BlobStorage) | `string` | `"StorageV2"` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure region for the Storage Account | `string` | `"westeurope"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Storage Account | `string` | n/a | yes |
| <a name="input_queues"></a> [queues](#input\_queues) | List of storage queues to create. Each object must include a `name`. | <pre>list(object({<br/>    name = string<br/>  }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group in which to create the Storage Account | `string` | n/a | yes |
| <a name="input_tables"></a> [tables](#input\_tables) | List of storage tables to create. Each object must include a `name`. | <pre>list(object({<br/>    name = string<br/>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to assign to the Storage Account | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Storage Account |
| <a name="output_primary_connection_string"></a> [primary\_connection\_string](#output\_primary\_connection\_string) | The primary connection string for the Storage Account |
<!-- END_TF_DOCS -->