resource "azurerm_eventhub_namespace" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  sku                      = var.sku
  capacity                 = var.capacity
  auto_inflate_enabled     = var.auto_inflate_enabled
  maximum_throughput_units = var.maximum_throughput_units
  tags                     = var.tags
}

resource "azurerm_eventhub" "eventhubs" {
  for_each            = { for eh in var.eventhubs : eh.name => eh }
  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.this.name
  resource_group_name = var.resource_group_name
  partition_count     = lookup(each.value, "partition_count", 2)
  message_retention   = lookup(each.value, "message_retention", 1)
}

locals {
  consumer_groups = flatten([
    for eh in var.eventhubs : [
      for cg in lookup(eh, "consumer_groups", []) : {
        eventhub_name = eh.name
        name          = cg
      }
    ]
  ])
}

resource "azurerm_eventhub_consumer_group" "consumer_groups" {
  for_each            = { for cg in local.consumer_groups : "${cg.eventhub_name}.${cg.name}" => cg }
  name                = each.value.name
  namespace_name      = azurerm_eventhub_namespace.this.name
  eventhub_name       = each.value.eventhub_name
  resource_group_name = var.resource_group_name
}