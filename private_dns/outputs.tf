output "id" {
  description = "The ID of the Private DNS zone"
  value       = azurerm_private_dns_zone.this.id
}

output "name" {
  description = "The name of the Private DNS zone"
  value       = azurerm_private_dns_zone.this.name
}