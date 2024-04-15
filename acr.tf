resource "azurerm_container_registry" "simple_infra_acr" {
  name                = var.simple_infra_acr_name
  resource_group_name = data.azurerm_resource_group.simple_infra_project_rg.name
  location            = data.azurerm_resource_group.simple_infra_project_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}