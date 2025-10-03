resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  kind                     = var.kind
  enable_https_traffic_only = var.enable_https_traffic_only

  tags = var.tags
}

// Provision blob containers when provided
resource "azurerm_storage_container" "this" {
  for_each = { for c in var.blob_containers : c.name => c }
  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.this.name
  container_access_type = lookup(each.value, "container_access_type", "private")
}

// Provision file shares when provided
resource "azurerm_storage_share" "this" {
  for_each = { for s in var.file_shares : s.name => s }
  name                 = each.value.name
  storage_account_name = azurerm_storage_account.this.name
  quota                = lookup(each.value, "quota", null)
  enabled_protocols    = lookup(each.value, "enabled_protocols", null)
  access_tier          = lookup(each.value, "access_tier", null)
}

// Provision queues when provided
resource "azurerm_storage_queue" "this" {
  for_each = { for q in var.queues : q.name => q }
  name                 = each.value.name
  storage_account_name = azurerm_storage_account.this.name
}

// Provision tables when provided
resource "azurerm_storage_table" "this" {
  for_each = { for t in var.tables : t.name => t }
  name                 = each.value.name
  storage_account_name = azurerm_storage_account.this.name
}