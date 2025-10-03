variable "name" {
  description = "Name of the Event Hub namespace"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the Event Hub namespace will be created"
  type        = string
}

variable "location" {
  description = "Azure region for the Event Hub namespace"
  type        = string
  default     = "westeurope"
}

variable "sku" {
  description = "SKU for the Event Hub namespace"
  type        = string
  default     = "Standard"
}

variable "capacity" {
  description = "Throughput units for the namespace"
  type        = number
  default     = 1
}

variable "auto_inflate_enabled" {
  description = "Whether auto-inflate is enabled"
  type        = bool
  default     = false
}

variable "maximum_throughput_units" {
  description = "Maximum throughput units when auto-inflate is enabled"
  type        = number
  default     = 0
}

variable "eventhubs" {
  description = "List of Event Hubs to create in the namespace"
  type = list(object({
    name             = string
    partition_count  = optional(number)
    message_retention = optional(number)
    consumer_groups  = optional(list(string))
  }))
  default = []
}

variable "tags" {
  description = "Tags to assign to the Event Hub namespace"
  type        = map(string)
  default     = {}
}