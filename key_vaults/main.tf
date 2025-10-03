resource "azurerm_key_vault" "this" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name

  soft_delete_retention_days =  var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled
  public_network_access_enabled = var.public_network_access_enabled
  enabled_for_deployment        = var.enabled_for_deployment
  enabled_for_disk_encryption   = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  dynamic "access_policy" {
    for_each = var.access_policies
    content {
      tenant_id = access_policy.value.tenant_id
      object_id = access_policy.value.object_id

      key_permissions         = lookup(access_policy.value, "key_permissions", ["Get"])
      secret_permissions      = lookup(access_policy.value, "secret_permissions", ["Get"])
      certificate_permissions = lookup(access_policy.value, "certificate_permissions", ["Get"])
      storage_permissions     = lookup(access_policy.value, "storage_permissions", ["Get"])
    }
  }

  tags = var.tags
}