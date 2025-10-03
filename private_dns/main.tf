resource "azurerm_private_dns_zone" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

// Create A records when provided
resource "azurerm_private_dns_a_record" "this" {
  for_each = { for rec in var.a_records : rec.name => rec }
  name                = each.value.name
  zone_name           = azurerm_private_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(each.value, "ttl", 300)
  records             = each.value.ipv4_addresses
}

// Create CNAME records when provided
resource "azurerm_private_dns_cname_record" "this" {
  for_each = { for rec in var.cname_records : rec.name => rec }
  name                = each.value.name
  zone_name           = azurerm_private_dns_zone.this.name
  resource_group_name = var.resource_group_name
  ttl                 = lookup(each.value, "ttl", 300)
  record              = each.value.record
}