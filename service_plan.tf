resource "azurerm_service_plan" "chatbot_plan" {
  name                = "chatbot-app-plan"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}