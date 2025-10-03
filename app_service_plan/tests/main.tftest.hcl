# Terraform test file for the app_service_plan module

# Configure the azurerm provider.  These tests rely on the caller to have
# authenticated to Azure.  The `features {}` block is required by the provider.
provider "azurerm" {
  features {}
}

# Supply input variables used by the module.  These values are only for
# demonstration purposes; adjust them to match your environment when running
# the tests.
variables {
  name                = "tf-test-app-service-plan"
  resource_group_name = "tf-test-rg"
  # location defaults to westeurope
  tags = {
    environment = "test"
  }
}

# The first run block performs a plan operation.  A plan run will not
# provision any real resources but allows Terraform to validate the module and
# compute a plan.
run "plan" {
  command = "plan"
}

# The second run block performs an apply.  When executed, Terraform will
# create the test resources.  You should only run this against a test
# subscription as it will incur costs.
run "apply" {
  command = "apply"
}