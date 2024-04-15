resource "azurerm_private_dns_zone" "simple_infra_dns" {
  name                = "${var.simple_infra_project_domain_name}.postgres.database.azure.com"
  resource_group_name = data.azurerm_resource_group.simple_infra_project_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "simple_infra_dnspvtlnk" {
  name                  = "${var.simple_infra_project_domain_name}.radixeng.com"
  private_dns_zone_name = azurerm_private_dns_zone.simple_infra_dns.name
  virtual_network_id    = data.azurerm_virtual_network.simple_infra_project_vnet.id
  resource_group_name   = data.azurerm_resource_group.simple_infra_project_rg.name
}

resource "azurerm_postgresql_flexible_server" "simple_infra_project_db" {
  name                   = var.simple_infra_project_db_name
  resource_group_name    = data.azurerm_resource_group.simple_infra_project_rg.name
  location               = var.location
  version                = "12"
  delegated_subnet_id    = data.azurerm_subnet.simple_infra_project_sbnt.id
  private_dns_zone_id    = azurerm_private_dns_zone.simple_infra_dns.id
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  zone                   = "1"

  storage_mb   = 32768
  storage_tier = "P30"

  sku_name = "B_Standard_B2s"
}