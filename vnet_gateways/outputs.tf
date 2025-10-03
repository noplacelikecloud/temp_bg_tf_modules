output "id" {
  description = "The ID of the Virtual Network Gateway"
  value       = azurerm_virtual_network_gateway.this.id
}

output "s2s_connection_ids" {
  description = "IDs of the site‑to‑site VPN connections created by this module, keyed by connection name"
  value       = { for k, c in azurerm_virtual_network_gateway_connection.this : k => c.id }
  depends_on  = [azurerm_virtual_network_gateway_connection.this]
}