resource "azurerm_linux_web_app" "frontend" {
  name                = "frontend"
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
  location            = data.azurerm_resource_group.chatbot_rg.location
  service_plan_id     = azurerm_service_plan.chatbot_plan.id

  site_config {}
}

resource "azurerm_linux_web_app" "backend" {
  name                = "backend"
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
  location            = data.azurerm_resource_group.chatbot_rg.location
  service_plan_id     = azurerm_service_plan.chatbot_plan.id

  site_config {}
}

resource "azurerm_linux_web_app" "modelservice" {
  name                = "model-service"
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
  location            = data.azurerm_resource_group.chatbot_rg.location
  service_plan_id     = azurerm_service_plan.chatbot_plan.id

  site_config {}
}