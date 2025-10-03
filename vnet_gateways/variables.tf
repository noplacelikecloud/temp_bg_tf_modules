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