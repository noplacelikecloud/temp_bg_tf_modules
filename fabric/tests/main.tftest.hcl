# Terraform test file for the fabric module

provider "azurerm" {
  features {}
}

variables {
  name                = "tf-test-fabric-cluster"
  resource_group_name = "tf-test-rg"
  location            = "westeurope"
  reliability_level   = "Bronze"
  upgrade_mode        = "Manual"
  management_endpoint = "https://tf-test-fabric-cluster.eastus.cloudapp.azure.com:19080"
  vm_image            = "Windows"
  # Use the default node_types defined in the module by omitting
  # the `node_types` variable here.  You can override it to test other
  # configurations.
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