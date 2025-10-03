# Terraform test file for the vnet_gateways module

provider "azurerm" {
  features {}
}

variables {
  name                = "tf-test-vnet-gw"
  resource_group_name = "tf-test-rg"
  location            = "westeurope"
  type                = "Vpn"
  vpn_type            = "RouteBased"
  generation          = "Generation1"
  sku                 = "VpnGw1"
  active_active       = false
  enable_bgp          = false
  ip_configuration_name = "vnetGatewayConfig"
  # IDs of existing resources; replace these with valid IDs in your environment
  public_ip_address_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/tf-test-rg/providers/Microsoft.Network/publicIPAddresses/tf-test-gw-ip"
  subnet_id            = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/tf-test-rg/providers/Microsoft.Network/virtualNetworks/tf-vnet/subnets/GatewaySubnet"
  tags = {
    environment = "test"
  }
  # Example point‑to‑site VPN client configuration
  vpn_client_configuration = {
    address_space        = ["172.16.0.0/24"]
    vpn_client_protocols = ["OpenVPN"]
    vpn_auth_types       = ["Certificate"]
    root_certificates = [
      {
        name             = "rootcert1"
        public_cert_data = "MIID...REPLACE_WITH_CERT_DATA..."
      }
    ]
    revoked_certificates = []
  }
  # Example site‑to‑site VPN connections; adapt to match your environment
  s2s_connections = [
    {
      name                    = "tf-test-s2s-connection"
      connection_type         = "IPsec"
      shared_key              = "AzureABCD12345"
      local_network_gateway_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/tf-test-rg/providers/Microsoft.Network/localNetworkGateways/onprem"
      enable_bgp              = false
    }
  ]
}

run "plan" {
  command = "plan"
}

run "apply" {
  command = "apply"
}