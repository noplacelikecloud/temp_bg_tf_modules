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

variable "kind" {
  description = "The kind of storage account (e.g., StorageV2, BlobStorage)"
  type        = string
  default     = "StorageV2"
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

variable "blob_containers" {
  description = "List of blob containers to create within the storage account. Each object should include a `name` and optional `container_access_type` (private, blob or container)."
  type = list(object({
    name                  = string
    container_access_type = optional(string)
  }))
  default = []
}

variable "file_shares" {
  description = "List of file shares to create. Each object must include a `name` and may include `quota` in GB, `access_tier` (Hot or Cool), and `enabled_protocols` (SMB, NFS or both)."
  type = list(object({
    name              = string
    quota             = optional(number)
    access_tier       = optional(string)
    enabled_protocols = optional(string)
  }))
  default = []
}

variable "queues" {
  description = "List of storage queues to create. Each object must include a `name`."
  type = list(object({
    name = string
  }))
  default = []
}

variable "tables" {
  description = "List of storage tables to create. Each object must include a `name`."
  type = list(object({
    name = string
  }))
  default = []
}