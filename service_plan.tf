resource "azurerm_service_plan" "chachat_plan" {
  name                = "chachat-app-plan"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.chachat_rg.name
  os_type             = "Linux"
  sku_name            = "B1"
}