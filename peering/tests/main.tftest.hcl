# Terraform test file for the peering module

// Configure providers.  The second provider has an alias used by the module
// when peering networks across subscriptions.  If both networks exist in the
// same subscription, these two provider blocks can be identical.
provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias    = "spoke"
  features {}
}

variables {
  hub_resource_group_name   = "hub-rg"
  hub_virtual_network_name  = "hub-vnet"
  hub_virtual_network_id    = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/hub-rg/providers/Microsoft.Network/virtualNetworks/hub-vnet"
  hub_subscription_id       = ""
  spoke_resource_group_name = "spoke-rg"
  spoke_virtual_network_name = "spoke-vnet"
  spoke_virtual_network_id  = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/spoke-rg/providers/Microsoft.Network/virtualNetworks/spoke-vnet"
  hub_peering_name          = "hub-to-spoke"
  spoke_peering_name        = "spoke-to-hub"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

run "plan" {
  command = "plan"
}

run "apply" {
  command = "apply"
}