resource "azurerm_postgresql_flexible_server" "chachat_db" {
  name                   = "chachat-psqlflexibleserver"
  resource_group_name    = data.azurerm_resource_group.chachat_rg.name
  location               = var.location
  version                = "12"
  delegated_subnet_id    = data.azurerm_subnet.chachat_sbnt.id
  private_dns_zone_id    = azurerm_private_dns_zone.chachat_dns_db.id
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  zone                   = "1"

  storage_mb   = 32768
  storage_tier = "P30"

  sku_name   = "GP_Standard_D4s_v3"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.chachat_vnetlink]

}