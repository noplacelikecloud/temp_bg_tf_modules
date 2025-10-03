variable "name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which to create the Storage Account"
  type        = string
}

variable "location" {
  description = "Azure region for the Storage Account"
  type        = string
  default     = "westeurope"
}

variable "account_tier" {
  description = "Storage Account performance tier (Standard or Premium)"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type for the Storage Account (e.g., LRS, GRS)"
  type        = string
  default     = "LRS"
}

variable "enable_https_traffic_only" {
  description = "Whether to only allow HTTPS traffic to the Storage Account"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to assign to the Storage Account"
  type        = map(string)
  default     = {}
}