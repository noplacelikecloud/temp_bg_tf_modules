# Terraform test file for the app_services module

provider "azurerm" {
  features {}
}

variables {
  name                = "tf-test-app-service"
  resource_group_name = "tf-test-rg"
  # Provide the ID of an existing App Service Plan.  Replace this with a
  # real resource ID when running the test.
  app_service_plan_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/tf-test-rg/providers/Microsoft.Web/serverfarms/tf-test-plan"
  # Optionally override site configuration values
  site_config = {
    always_on     = true
    ftps_state    = "Disabled"
    http2_enabled = false
  }
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