variable "name" {
  description = "Name of the Service Fabric cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the cluster"
  type        = string
}

variable "location" {
  description = "Azure region where the cluster will be created"
  type        = string
  default     = "westeurope"
}

variable "reliability_level" {
  description = "Reliability level (e.g., Bronze, Silver, Gold, Platinum)"
  type        = string
  default     = "Bronze"
}

variable "upgrade_mode" {
  description = "Upgrade mode (e.g., Manual, Automatic)"
  type        = string
  default     = "Manual"
}

variable "management_endpoint" {
  description = "Management endpoint URL for the cluster"
  type        = string
}

variable "vm_image" {
  description = "VM image to use for the cluster"
  type        = string
  default     = "Windows"
}

variable "node_types" {
  description = "List of node type configurations"
  type = list(object({
    name                        = string
    instance_count              = number
    is_primary                  = bool
    client_endpoint_port        = number
    http_endpoint_port          = number
    durability_level            = optional(string)
    reverse_proxy_endpoint_port = optional(number)
    application_ports           = optional(list(object({
      start_port = number
      end_port   = number
    })))
    ephemeral_ports             = optional(list(object({
      start_port = number
      end_port   = number
    })))
  }))
  default = [
    {
      name                        = "nt1"
      instance_count              = 5
      is_primary                  = true
      client_endpoint_port        = 19000
      http_endpoint_port          = 19080
      durability_level            = "Bronze"
      reverse_proxy_endpoint_port = 19085
      application_ports = [
        {
          start_port = 30000
          end_port   = 30999
        }
      ]
      ephemeral_ports = [
        {
          start_port = 31100
          end_port   = 31999
        }
      ]
    }
  ]
}

variable "tags" {
  description = "Tags to assign to the cluster"
  type        = map(string)
  default     = {}
}