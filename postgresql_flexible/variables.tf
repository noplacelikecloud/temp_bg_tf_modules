variable "name" {
  description = "Name of the PostgreSQL Flexible Server"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the PostgreSQL Flexible Server will be created"
  type        = string
}

variable "location" {
  description = "Azure region for the PostgreSQL Flexible Server"
  type        = string
  default     = "westeurope"
}

variable "administrator_login" {
  description = "Administrator login name"
  type        = string
  default     = "psqladmin"
}

variable "administrator_password" {
  description = "Administrator password (sensitive)"
  type        = string
  sensitive   = true
}

variable "sku_name" {
  description = "SKU name for the PostgreSQL Flexible Server"
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "version" {
  description = "PostgreSQL version"
  type        = string
  default     = "15"
}

variable "storage_mb" {
  description = "Storage size in megabytes"
  type        = number
  default     = 32768
}

variable "backup_retention_days" {
  description = "Backup retention in days"
  type        = number
  default     = 7
}

variable "geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backups"
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Tags to assign to the PostgreSQL Flexible Server"
  type        = map(string)
  default     = {}
}