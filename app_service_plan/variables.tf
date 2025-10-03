variable "name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the App Service Plan will be created"
  type        = string
}

variable "location" {
  description = "Azure region for the App Service Plan"
  type        = string
  default     = "westeurope"
}

variable "os_type" {
  description = "Operating system type (Windows or Linux)"
  type        = string
  default     = "Windows"
}

variable "sku_name" {
  description = "SKU name for the App Service Plan"
  type        = string
  default     = "B1"
}

variable "worker_count" {
  description = "Number of workers for the plan"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Tags to assign to the App Service Plan"
  type        = map(string)
  default     = {}
}