resource "azurerm_servicebus_namespace" "chatbot_namespace" {
  name                = "chatbot-service-bus"
  location            = data.azurerm_resource_group.chatbot_rg.location
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "chatbot_queue" {
  name         = "chatbot-queue"
  namespace_id = azurerm_servicebus_namespace.chatbot_namespace.id

  enable_partitioning = true
}