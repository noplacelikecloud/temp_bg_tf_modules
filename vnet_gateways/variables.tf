variable "name" {
  description = "Name of the Virtual Network Gateway"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the gateway will be created"
  type        = string
}

variable "location" {
  description = "Azure region for the gateway"
  type        = string
  default     = "westeurope"
}

variable "type" {
  description = "The type of gateway (Vpn or ExpressRoute)"
  type        = string
  default     = "Vpn"
}

variable "vpn_type" {
  description = "The VPN type (PolicyBased or RouteBased)"
  type        = string
  default     = "RouteBased"
}

variable "generation" {
  description = "The generation of the gateway (Generation1 or Generation2)"
  type        = string
  default     = "Generation1"
}

variable "sku" {
  description = "The SKU of the gateway"
  type        = string
  default     = "VpnGw1"
}

variable "active_active" {
  description = "Whether this VPN gateway is active-active"
  type        = bool
  default     = false
}

variable "enable_bgp" {
  description = "Enable BGP on the gateway"
  type        = bool
  default     = false
}

variable "ip_configuration_name" {
  description = "Name for the IP configuration block"
  type        = string
  default     = "vnetGatewayConfig"
}

variable "public_ip_address_id" {
  description = "The ID of the public IP address to associate with the gateway"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the gateway will be placed (GatewaySubnet)"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the Virtual Network Gateway"
  type        = map(string)
  default     = {}
}

variable "vpn_client_configuration" {
  description = "VPN client configuration for point‑to‑site connectivity. When set to null no point‑to‑site configuration is added. See the README for schema details."
  type = object({
    address_space        = optional(list(string))
    vpn_client_protocols = optional(list(string))
    vpn_auth_types       = optional(list(string))
    aad = optional(object({
      tenant   = string
      audience = string
      issuer   = string
    }))
    root_certificates = optional(list(object({
      name             = string
      public_cert_data = string
    })))
    revoked_certificates = optional(list(object({
      name       = string
      thumbprint = string
    })))
  })
  default     = null
}

variable "s2s_connections" {
  description = "List of site‑to‑site VPN connections to create for this gateway. Each object may specify `local_network_gateway_id` or `peer_virtual_network_gateway_id` along with connection properties."
  type = list(object({
    name                            = string
    connection_type                 = string
    shared_key                      = string
    local_network_gateway_id        = optional(string)
    peer_virtual_network_gateway_id = optional(string)
    enable_bgp                      = optional(bool)
    ipsec_policy = optional(object({
      dh_group         = string
      ike_encryption   = string
      ike_integrity    = string
      ipsec_encryption = string
      ipsec_integrity  = string
      pfs_group        = string
      sa_lifetime      = number
      sa_data_size     = number
    }))
  }))
  default = []
}