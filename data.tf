data "azurerm_resource_group" "chatbot_rg" {
  name = var.chatbot_rg
}

data "azurerm_network_security_group" "chatbot_nsg" {
  name                = var.chatbot_nsg
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
}

data "azurerm_virtual_network" "chatbot_vnet" {
  name                = var.chatbot_vnet
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
}

data "azurerm_route_table" "chatbot" {
  name                = var.chatbot_rt
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
}

data "azurerm_subnet" "chatbot_sbnt" {
  name                 = var.chatbot_sbnt
  resource_group_name  = data.azurerm_resource_group.chatbot_rg.name
  virtual_network_name = data.azurerm_virtual_network.chatbot_vnet.name
}