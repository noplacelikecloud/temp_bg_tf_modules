terraform {
  required_version = ">= 1.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.47.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias    = "hub"
  features {}
  
  subscription_id = var.hub_subscription_id
}