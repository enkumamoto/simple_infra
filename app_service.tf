resource "azurerm_app_service" "frontend" {
  name                = "frontend"
  location            = azurerm_resource_group.chachat_rg.location
  resource_group_name = azurerm_resource_group.chachat_rg.name
  app_service_plan_id = azurerm_service_plan.chachat_plan.id

  site_config {
    always_on = true
  }
}

resource "azurerm_app_service" "backend" {
  name                = "backend"
  location            = azurerm_resource_group.chachat_rg.location
  resource_group_name = azurerm_resource_group.chachat_rg.name
  app_service_plan_id = azurerm_service_plan.chachat_plan.id

  site_config {
    always_on = true
  }
}

resource "azurerm_app_service" "model_service" {
  name                = "model_service"
  location            = azurerm_resource_group.chachat_rg.location
  resource_group_name = azurerm_resource_group.chachat_rg.name
  app_service_plan_id = azurerm_service_plan.chachat_plan.id

  site_config {
    always_on = true
  }
}

