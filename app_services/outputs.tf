output "id" {
  description = "The ID of the App Service"
  value       = azurerm_app_service.this.id
}

output "default_site_hostname" {
  description = "The default hostname of the App Service"
  value       = azurerm_app_service.this.default_site_hostname
}