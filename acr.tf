resource "azurerm_container_registry" "chatbot_acr" {
  name                = var.chatbot_acr_name
  resource_group_name = data.azurerm_resource_group.chatbot_project_rg.name
  location            = data.azurerm_resource_group.chatbot_project_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}