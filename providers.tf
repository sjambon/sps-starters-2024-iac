terraform {
  required_providers {
    # Azure erm
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
    # Azure API
    azapi = {
      source  = "Azure/azapi"
      version = "2.0.0-beta"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

provider "azapi" {
}

# kubectl port-forward svc/argocd-server -n argocd 8080:443
provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.sps_k8_cluster.kube_config[0].host
    client_certificate     = base64decode(azurerm_kubernetes_cluster.sps_k8_cluster.kube_config[0].client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.sps_k8_cluster.kube_config[0].client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.sps_k8_cluster.kube_config[0].cluster_ca_certificate)
  }
}