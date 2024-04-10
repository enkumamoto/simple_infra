resource "azurerm_service_bus_namespace" "main" {
  name                = "main-service-bus"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"
}

resource "azurerm_service_bus_queue" "main" {
  name                         = "main-queue"
  namespace_name               = azurerm_service_bus_namespace.main.name
  max_size_in_megabytes        = 1024
  default_message_time_to_live = "PT1H"
}