output "hub_to_spoke_id" {
  description = "The ID of the hub‑to‑spoke virtual network peering"
  value       = azurerm_virtual_network_peering.hub_to_spoke.id
}

output "spoke_to_hub_id" {
  description = "The ID of the spoke‑to‑hub virtual network peering"
  value       = azurerm_virtual_network_peering.spoke_to_hub.id
}