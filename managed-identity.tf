data "azurerm_resource_group" "node_rg" {
  name = azurerm_kubernetes_cluster.aks.node_resource_group
}
resource "azurerm_user_assigned_identity" "identity" {
  name                = var.identity_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
}

resource "azurerm_role_assignment" "vnet_contrib" {
  scope                = azurerm_virtual_network.vnet.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.identity.principal_id
}