resource "azurerm_service_plan" "chatbot_project_plan" {
  name                = "chatbot_project-app-plan"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.chatbot_project_rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}