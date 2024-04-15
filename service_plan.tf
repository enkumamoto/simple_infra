resource "azurerm_service_plan" "simple_infra_project_plan" {
  name                = "simple_infra_project-app-plan"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.simple_infra_project_rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}