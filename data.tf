data "azurerm_resource_group" "simple_infra_project_rg" {
  name = var.simple_infra_project_rg
}

data "azurerm_network_security_group" "simple_infra_project_nsg" {
  name                = var.simple_infra_project_nsg
  resource_group_name = data.azurerm_resource_group.simple_infra_project_rg.name
}

data "azurerm_virtual_network" "simple_infra_project_vnet" {
  name                = var.simple_infra_project_vnet
  resource_group_name = data.azurerm_resource_group.simple_infra_project_rg.name
}

data "azurerm_route_table" "simple_infra_project" {
  name                = var.simple_infra_project_rt
  resource_group_name = data.azurerm_resource_group.simple_infra_project_rg.name
}

data "azurerm_subnet" "simple_infra_project_sbnt" {
  name                 = var.simple_infra_project_sbnt
  resource_group_name  = data.azurerm_resource_group.simple_infra_project_rg.name
  virtual_network_name = data.azurerm_virtual_network.simple_infra_project_vnet.name
}