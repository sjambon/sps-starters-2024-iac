terraform {
 required_providers {
    # Azure erm
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.3.0"
    }
    # Azure API
    azapi = {
      source = "Azure/azapi"
      version = "2.0.0-beta"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = var.subscription_id
    client_id = var.client_id
    client_secret = var.client_secret
    tenant_id = var.tenant_id
}

provider "azapi" {
}
