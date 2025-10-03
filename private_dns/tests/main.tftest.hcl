# Terraform test file for the private_dns module

provider "azurerm" {
  features {}
}

variables {
  name                = "privatelink.test.internal"
  resource_group_name = "tf-test-rg"
  a_records = [
    {
      name           = "db1"
      ipv4_addresses = ["10.0.0.10"]
      ttl            = 300
    }
  ]
  cname_records = [
    {
      name  = "www"
      record = "db1.privatelink.test.internal"
      ttl   = 300
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