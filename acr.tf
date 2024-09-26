resource "azurerm_resource_group" "sps_test_registry" {
  name     = "${var.prefix}-container-registry"
  location = var.location
}

resource "azurerm_container_registry" "sps_cr" {
  name                = "spsContainerRegistryAE"
  resource_group_name = azurerm_resource_group.sps_test_registry.name
  location            = azurerm_resource_group.sps_test_registry.location
  sku                 = var.sku
  admin_enabled       = true
}

resource "github_actions_secret" "login_server" {
  repository      = "sps-starters-2024-ducks"
  secret_name     = "LOGIN_SERVER"
  plaintext_value = azurerm_container_registry.sps_cr.login_server
}

resource "github_actions_secret" "add_admin_password" {
  repository      = "sps-starters-2024-ducks"
  secret_name     = "PASSWORD"
  plaintext_value = azurerm_container_registry.sps_cr.admin_password
}

resource "github_actions_secret" "add_admin_username" {
  repository      = "sps-starters-2024-ducks"
  secret_name     = "USERNAME"
  plaintext_value = azurerm_container_registry.sps_cr.admin_username
}

