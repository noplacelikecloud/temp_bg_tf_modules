variable "name" {
  description = "Name of the Private DNS zone"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group in which the Private DNS zone will be created"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the Private DNS zone"
  type        = map(string)
  default     = {}
}

variable "a_records" {
  description = "List of A records to create. Each object should have `name`, `ipv4_addresses` (list of IPv4 addresses), and an optional `ttl` in seconds."
  type = list(object({
    name           = string
    ipv4_addresses = list(string)
    ttl            = optional(number)
  }))
  default = []
}

variable "cname_records" {
  description = "List of CNAME records to create. Each object should have `name`, `record` (target hostname), and an optional `ttl` in seconds."
  type = list(object({
    name  = string
    record = string
    ttl   = optional(number)
  }))
  default = []
}