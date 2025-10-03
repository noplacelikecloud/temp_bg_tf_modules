output "id" {
  description = "The ID of the Storage Account"
  value       = azurerm_storage_account.this.id
}

output "primary_connection_string" {
  description = "The primary connection string for the Storage Account"
  value       = azurerm_storage_account.this.primary_connection_string
}