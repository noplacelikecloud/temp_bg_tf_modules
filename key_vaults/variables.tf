variable "name" {
  description = "Name of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where the Key Vault will be created"
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault"
  type        = string
  default     = "westeurope"
}

variable "tenant_id" {
  description = "Tenant ID for the Key Vault"
  type        = string
}

variable "sku_name" {
  description = "SKU name (standard or premium)"
  type        = string
  default     = "standard"
}

variable "soft_delete_retention_days" {
  description = "Soft delete retention days (7-90 days)"
  type        = number
  default     = 7
}

variable "purge_protection_enabled" {
  description = "Enable purge protection"
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed"
  type        = bool
  default     = true
}

variable "enabled_for_deployment" {
  description = "Whether Azure VMs can be deployed with certificates from the vault"
  type        = bool
  default     = false
}

variable "enabled_for_disk_encryption" {
  description = "Whether Azure Disk Encryption is enabled"
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Whether the key vault is enabled for ARM template deployment"
  type        = bool
  default     = false
}

variable "access_policies" {
  description = "List of access policy objects"
  type = list(object({
    tenant_id             = string
    object_id             = string
    key_permissions       = optional(list(string))
    secret_permissions    = optional(list(string))
    certificate_permissions = optional(list(string))
    storage_permissions   = optional(list(string))
  }))
  default = []
}

variable "tags" {
  description = "Tags to assign to the Key Vault"
  type        = map(string)
  default     = {}
}