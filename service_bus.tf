resource "azurerm_servicebus_namespace" "chachat_namespace" {
  name                = "chachat-service-bus"
  location            = data.azurerm_resource_group.chachat_rg.location
  resource_group_name = data.azurerm_resource_group.chachat_rg.name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "chachat_queue" {
  name         = "chachat-queue"
  namespace_id = azurerm_servicebus_namespace.chachat_namespace.id

  enable_partitioning = true
}