# Terraform test file for the postgresql_flexible module

provider "azurerm" {
  features {}
}

variables {
  name                   = "tf-test-postgresql"
  resource_group_name    = "tf-test-rg"
  location               = "westeurope"
  administrator_login    = "psqladmin"
  # Use a strong password appropriate for testing.  In a real environment,
  # secrets should be stored securely and not committed to source control.
  administrator_password = "P@ssw0rd1234!"
  sku_name               = "GP_Standard_D2s_v3"
  version                = "15"
  storage_mb             = 32768
  backup_retention_days  = 7
  geo_redundant_backup_enabled  = false
  public_network_access_enabled = true
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