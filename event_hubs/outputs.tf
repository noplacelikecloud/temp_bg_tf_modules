output "namespace_id" {
  description = "The ID of the Event Hub namespace"
  value       = azurerm_eventhub_namespace.this.id
}

output "namespace_name" {
  description = "The name of the Event Hub namespace"
  value       = azurerm_eventhub_namespace.this.name
}