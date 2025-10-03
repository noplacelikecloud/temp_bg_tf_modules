# Terraform test file for the key_vaults module

provider "azurerm" {
  features {}
}

variables {
  name                = "tf-test-keyvault"
  resource_group_name = "tf-test-rg"
  location            = "westeurope"
  tenant_id           = "00000000-0000-0000-0000-000000000000"
  sku_name            = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled  = false
  public_network_access_enabled = true
  enabled_for_deployment        = false
  enabled_for_disk_encryption   = false
  enabled_for_template_deployment = false
  access_policies = [
    {
      tenant_id   = "00000000-0000-0000-0000-000000000000"
      object_id   = "11111111-1111-1111-1111-111111111111"
      key_permissions       = ["Get", "List"]
      secret_permissions    = ["Get", "List"]
      certificate_permissions = ["Get"]
      storage_permissions   = ["Get"]
    }
  ]
  tags = {
    environment = "test"
  }
}

run "plan" {
  command = "plan"
}

run "apply" {
  command = "apply"
}