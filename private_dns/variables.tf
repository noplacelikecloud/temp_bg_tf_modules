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