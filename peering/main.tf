/*
  Two‑way virtual network peering.

  Peering a hub and spoke network requires two separate peering resources –
  one from the hub to the spoke and another from the spoke to the hub.  This
  module creates both resources.  It accepts identifiers and names for each
  virtual network and, if necessary, can be used with provider aliases
  configured in the parent module to peer networks across subscriptions.

  Use the `hub_*` variables to describe the hub side of the peering and the
  `spoke_*` variables for the spoke.  The `*_peering_name` values default to
  sensible names but can be overridden.  Settings like `allow_forwarded_traffic`
  and `use_remote_gateways` apply to both directions of the peering.
*/

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = var.hub_peering_name
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = var.hub_virtual_network_name
  remote_virtual_network_id = var.spoke_virtual_network_id

  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.allow_gateway_transit
  use_remote_gateways          = var.use_remote_gateways

  # If you need to peer networks across subscriptions, configure provider
  # aliases in the calling module and specify them via the providers block.
  # provider = azurerm.hub
}

resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = var.spoke_peering_name
  resource_group_name       = var.spoke_resource_group_name
  virtual_network_name      = var.spoke_virtual_network_name
  remote_virtual_network_id = var.hub_virtual_network_id

  allow_virtual_network_access = var.allow_virtual_network_access
  allow_forwarded_traffic      = var.allow_forwarded_traffic
  allow_gateway_transit        = var.allow_gateway_transit
  use_remote_gateways          = var.use_remote_gateways

  # provider = azurerm.spoke
}