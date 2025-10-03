resource "azurerm_app_service" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = var.app_service_plan_id

  https_only              = var.https_only
  client_affinity_enabled = var.client_affinity_enabled

  dynamic "site_config" {
    for_each = var.site_config != null ? [var.site_config] : []
    content {
      always_on     = lookup(site_config.value, "always_on", true)
      ftps_state    = lookup(site_config.value, "ftps_state", "Disabled")
      http2_enabled = lookup(site_config.value, "http2_enabled", false)
    }
  }

  app_settings = var.app_settings

  tags = var.tags
}