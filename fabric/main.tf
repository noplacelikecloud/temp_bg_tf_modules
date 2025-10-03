resource "azurerm_service_fabric_cluster" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  reliability_level   = var.reliability_level
  upgrade_mode        = var.upgrade_mode
  management_endpoint = var.management_endpoint
  vm_image            = var.vm_image

  dynamic "node_type" {
    for_each = var.node_types
    content {
      name                       = node_type.value.name
      instance_count             = node_type.value.instance_count
      is_primary                 = node_type.value.is_primary
      client_endpoint_port       = node_type.value.client_endpoint_port
      http_endpoint_port         = node_type.value.http_endpoint_port
      durability_level           = try(node_type.value.durability_level, null)
      reverse_proxy_endpoint_port = try(node_type.value.reverse_proxy_endpoint_port, null)

      dynamic "application_ports" {
        for_each = try(node_type.value.application_ports, [])
        content {
          start_port = application_ports.value.start_port
          end_port   = application_ports.value.end_port
        }
      }

      dynamic "ephemeral_ports" {
        for_each = try(node_type.value.ephemeral_ports, [])
        content {
          start_port = ephemeral_ports.value.start_port
          end_port   = ephemeral_ports.value.end_port
        }
      }
    }
  }

  tags = var.tags
}