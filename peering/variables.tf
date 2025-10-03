variable "name" {
  description = "Name of the virtual network peering"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group of the virtual network"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the local virtual network"
  type        = string
}

variable "remote_virtual_network_id" {
  description = "ID of the remote virtual network"
  type        = string
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
  description = "Whether gateway links can be used in the remote virtual network"
  type        = bool
  default     = false
}

variable "use_remote_gateways" {
  description = "Whether the peering will use the remote virtual network's gateway"
  type        = bool
  default     = false
}