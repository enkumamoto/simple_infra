data "azurerm_resource_group" "chatbot_project_rg" {
  name = var.chatbot_project_rg
}

data "azurerm_network_security_group" "chatbot_project_nsg" {
  name                = var.chatbot_project_nsg
  resource_group_name = data.azurerm_resource_group.chatbot_project_rg.name
}

data "azurerm_virtual_network" "chatbot_project_vnet" {
  name                = var.chatbot_project_vnet
  resource_group_name = data.azurerm_resource_group.chatbot_project_rg.name
}

data "azurerm_route_table" "chatbot_project" {
  name                = var.chatbot_project_rt
  resource_group_name = data.azurerm_resource_group.chatbot_project_rg.name
}

data "azurerm_subnet" "chatbot_project_sbnt" {
  name                 = var.chatbot_project_sbnt
  resource_group_name  = data.azurerm_resource_group.chatbot_project_rg.name
  virtual_network_name = data.azurerm_virtual_network.chatbot_project_vnet.name
}