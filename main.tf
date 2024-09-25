locals {
  default_tags = merge(var.default_tags, {
    environment = var.environment
  })
}

# K8
resource "azurerm_resource_group" "sps_k8" {
  name     = "${var.prefix}-k8s-resources-${var.environment}"
  location = var.location
  tags     = local.default_tags
}

resource "azurerm_automation_account" "sps_automation_account" {
  name                = "${var.prefix}-account"
  resource_group_name = azurerm_resource_group.sps_k8.name
  location            = var.location
  sku_name            = "Basic"
  tags                = local.default_tags
}

data "azapi_resource_action" "sps_resource_action" {
  type                   = "Microsoft.Automation/automationAccounts@2021-06-22"
  resource_id            = azurerm_automation_account.sps_automation_account.id
  action                 = "listKeys"
  response_export_values = ["*"]
}

resource "azurerm_kubernetes_cluster" "sps_k8_cluster" {
  name                = "${var.prefix}-k8s"
  location            = azurerm_resource_group.sps_k8.location
  resource_group_name = azurerm_resource_group.sps_k8.name
  dns_prefix          = "${var.prefix}-k8s"
  tags                = local.default_tags

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Destory the resource group
