variable "name" {
  description = "Name of the App Service (web app)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the App Service will be created"
  type        = string
}

variable "location" {
  description = "Azure region for the App Service"
  type        = string
  default     = "westeurope"
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan to associate with this app"
  type        = string
}

variable "https_only" {
  description = "Whether the App Service should enforce HTTPS only"
  type        = bool
  default     = true
}

variable "client_affinity_enabled" {
  description = "Whether to use client affinity (sticky sessions)"
  type        = bool
  default     = false
}

variable "site_config" {
  description = "App Service site configuration"
  type = object({
    always_on     = optional(bool)
    ftps_state    = optional(string)
    http2_enabled = optional(bool)
  })
  default = {
    always_on     = true
    ftps_state    = "Disabled"
    http2_enabled = false
  }
}

variable "app_settings" {
  description = "Map of application settings for the App Service"
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags to assign to the App Service"
  type        = map(string)
  default     = {}
}