resource "azurerm_virtual_network_gateway" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  type       = var.type
  vpn_type   = var.vpn_type
  generation = var.generation
  sku        = var.sku
  active_active = var.active_active
  enable_bgp    = var.enable_bgp

  ip_configuration {
    name                          = var.ip_configuration_name
    public_ip_address_id          = var.public_ip_address_id
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags

  # Optional VPN client configuration for point‑to‑site (P2S) connections
  dynamic "vpn_client_configuration" {
    for_each = var.vpn_client_configuration != null ? [var.vpn_client_configuration] : []
    content {
      address_space        = lookup(vpn_client_configuration.value, "address_space", null)
      vpn_client_protocols = lookup(vpn_client_configuration.value, "vpn_client_protocols", null)
      vpn_auth_types       = lookup(vpn_client_configuration.value, "vpn_auth_types", null)

      # Azure AD authentication configuration
      dynamic "azure_active_directory_authentication" {
        for_each = lookup(vpn_client_configuration.value, "aad", null) != null ? [vpn_client_configuration.value.aad] : []
        content {
          tenant   = lookup(azure_active_directory_authentication.value, "tenant", null)
          audience = lookup(azure_active_directory_authentication.value, "audience", null)
          issuer   = lookup(azure_active_directory_authentication.value, "issuer", null)
        }
      }

      # Root certificates for certificate based authentication
      dynamic "root_certificate" {
        for_each = lookup(vpn_client_configuration.value, "root_certificates", [])
        content {
          name             = root_certificate.value.name
          public_cert_data = root_certificate.value.public_cert_data
        }
      }

      # Revoked certificates
      dynamic "revoked_certificate" {
        for_each = lookup(vpn_client_configuration.value, "revoked_certificates", [])
        content {
          name       = revoked_certificate.value.name
          thumbprint = revoked_certificate.value.thumbprint
        }
      }
    }
  }
}

// Optional site‑to‑site (S2S) connections to remote gateways or on‑premises networks
resource "azurerm_virtual_network_gateway_connection" "this" {
  for_each = { for c in var.s2s_connections : c.name => c }
  name                            = each.value.name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  virtual_network_gateway_id      = azurerm_virtual_network_gateway.this.id
  connection_type                 = each.value.connection_type
  shared_key                      = each.value.shared_key
  local_network_gateway_id        = lookup(each.value, "local_network_gateway_id", null)
  peer_virtual_network_gateway_id = lookup(each.value, "peer_virtual_network_gateway_id", null)
  enable_bgp                      = lookup(each.value, "enable_bgp", false)

  dynamic "ipsec_policy" {
    for_each = lookup(each.value, "ipsec_policy", null) != null ? [each.value.ipsec_policy] : []
    content {
      dh_group         = ipsec_policy.value.dh_group
      ike_encryption   = ipsec_policy.value.ike_encryption
      ike_integrity    = ipsec_policy.value.ike_integrity
      ipsec_encryption = ipsec_policy.value.ipsec_encryption
      ipsec_integrity  = ipsec_policy.value.ipsec_integrity
      pfs_group        = ipsec_policy.value.pfs_group
      sa_lifetime      = ipsec_policy.value.sa_lifetime
      sa_data_size     = ipsec_policy.value.sa_data_size
    }
  }
}