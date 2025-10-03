resource "azurerm_virtual_network_gateway" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  type       = var.type
  vpn_type   = var.vpn_type
  generation = var.generation
  sku        = var.sku
  active_active = var.active_active
  enable_bgp    = var.enable_bgp

  ip_configuration {
    name                          = var.ip_configuration_name
    public_ip_address_id          = var.public_ip_address_id
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}