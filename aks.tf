resource "azurerm_kubernetes_cluster" "aks" {
  name                      = var.aks_name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.rg.name
  dns_prefix                = "${var.aks_name}-dns"
  oidc_issuer_enabled       = true
  workload_identity_enabled = true
  kubernetes_version        = "1.33.0"
  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_data_plane  = "cilium"
    network_policy      = "cilium"
    load_balancer_sku   = "standard"
  }

  default_node_pool {
    name                         = "default"
    node_count                   = 1
    vm_size                      = "Standard_DS2_v2"
    only_critical_addons_enabled = true
    upgrade_settings {
      drain_timeout_in_minutes      = 0
      max_surge                     = "10%"
      node_soak_duration_in_minutes = 0
    }
  }
}

resource "azapi_update_resource" "nap" {
  type                    = "Microsoft.ContainerService/managedClusters@2025-07-02-preview"
  resource_id             = azurerm_kubernetes_cluster.aks.id
  ignore_missing_property = true
  body = {
    properties = {
      nodeProvisioningProfile = {
        mode = "Auto"
        defaultNodePools = "None"
      }
    }
  }
}
