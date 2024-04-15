resource "azurerm_private_dns_zone" "chatbot_dns" {
  name                = "${var.chatbot_project_domain_name}.postgres.database.azure.com"
  resource_group_name = data.azurerm_resource_group.chatbot_project_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "chatbot_dnspvtlnk" {
  name                  = "${var.chatbot_project_domain_name}.radixeng.com"
  private_dns_zone_name = azurerm_private_dns_zone.chatbot_dns.name
  virtual_network_id    = data.azurerm_virtual_network.chatbot_project_vnet.id
  resource_group_name   = data.azurerm_resource_group.chatbot_project_rg.name
}

resource "azurerm_postgresql_flexible_server" "chatbot_project_db" {
  name                   = var.chatbot_project_db_name
  resource_group_name    = data.azurerm_resource_group.chatbot_project_rg.name
  location               = var.location
  version                = "12"
  delegated_subnet_id    = data.azurerm_subnet.chatbot_project_sbnt.id
  private_dns_zone_id    = azurerm_private_dns_zone.chatbot_dns.id
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  zone                   = "1"

  storage_mb   = 32768
  storage_tier = "P30"

  sku_name = "B_Standard_B2s"
}