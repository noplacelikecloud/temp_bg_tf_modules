variable "hub_resource_group_name" {
  description = "Resource group name of the hub virtual network"
  type        = string
}

variable "hub_virtual_network_name" {
  description = "Name of the hub virtual network"
  type        = string
}

variable "hub_virtual_network_id" {
  description = "Resource ID of the hub virtual network"
  type        = string
}

variable "spoke_resource_group_name" {
  description = "Resource group name of the spoke virtual network"
  type        = string
}

variable "spoke_virtual_network_name" {
  description = "Name of the spoke virtual network"
  type        = string
}

variable "spoke_virtual_network_id" {
  description = "Resource ID of the spoke virtual network"
  type        = string
}

variable "hub_peering_name" {
  description = "Name for the hub‑to‑spoke peering resource"
  type        = string
  default     = "hub-to-spoke"
}

variable "spoke_peering_name" {
  description = "Name for the spoke‑to‑hub peering resource"
  type        = string
  default     = "spoke-to-hub"
}

variable "allow_virtual_network_access" {
  description = "Whether to allow virtual network access across the peering"
  type        = bool
  default     = true
}

variable "allow_forwarded_traffic" {
  description = "Whether forwarded traffic from the VMs in the peered network is allowed"
  type        = bool
  default     = false
}

variable "allow_gateway_transit" {
  description = "Whether gateway transit is allowed across the peering"
  type        = bool
  default     = false
}

variable "use_remote_gateways" {
  description = "Whether the peering will use the remote virtual network's gateway"
  type        = bool
  default     = false
}