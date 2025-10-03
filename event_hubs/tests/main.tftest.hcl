# Terraform test file for the event_hubs module

provider "azurerm" {
  features {}
}

variables {
  name                = "tf-test-eventhub-ns"
  resource_group_name = "tf-test-rg"
  location            = "westeurope"
  sku                 = "Standard"
  capacity            = 1
  auto_inflate_enabled     = false
  maximum_throughput_units = 0
  eventhubs = [
    {
      name             = "tf-test-eventhub"
      partition_count  = 2
      message_retention = 1
      consumer_groups  = ["cg1"]
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