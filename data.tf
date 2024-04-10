data "azurerm_resource_group" "chachat_rg" {
  name = var.chachat_rg
}

data "azurerm_security_gruop" "chachat_sg" {
  name                = var.chachat_nsg
  resource_group_name = data.azurerm_resource_group.chachat_rg.name
}

data "azurerm_virtual_network" "chachat_vnet" {
  name                = var.chachat_vnet
  resource_group_name = data.azurerm_resource_group.chachat_rg.name
}

data "azurerm_route_table" "chachat" {
  name                = var.chachat_rt
  resource_group_name = data.azurerm_resource_group.chachat_rg.name
}

data "azurerm_subnet" "chachat_sbnt" {
  name                 = var.chachat_sbnt
  resource_group_name  = data.azurerm_resource_group.chachat_rg.name
  virtual_network_name = data.azurerm_virtual_network.chachat_vnet.id
}