# Terraform test file for the storage_accounts module

provider "azurerm" {
  features {}
}

variables {
  name                = "tfstoragetest123"
  resource_group_name = "tf-test-rg"
  location            = "westeurope"
  account_tier        = "Standard"
  account_replication_type = "LRS"
  kind                = "StorageV2"
  enable_https_traffic_only = true
  tags = {
    environment = "test"
  }
  blob_containers = [
    {
      name                  = "container1"
      container_access_type = "private"
    }
  ]
  file_shares = [
    {
      name              = "share1"
      quota             = 10
      access_tier       = "Hot"
      enabled_protocols = "SMB"
    }
  ]
  queues = [
    { name = "queue1" }
  ]
  tables = [
    { name = "table1" }
  ]
}

run "plan" {
  command = "plan"
}

run "apply" {
  command = "apply"
}