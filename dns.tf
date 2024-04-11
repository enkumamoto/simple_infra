resource "azurerm_private_dns_zone" "chatbot_dns_db" {
  name                = "example.postgres.database.azure.com"
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "chatbot_vnetlink" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.chatbot_dns_db.name
  virtual_network_id    = data.azurerm_virtual_network.chatbot_vnet.id
  resource_group_name   = data.azurerm_resource_group.chatbot_rg.name
}

resource "azurerm_dns_zone" "chatbot_dns" {
  name                = ""
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
}

resource "azurerm_dns_a_record" "dns_a_frontend" {
  name                = "frontend"
  resource_group_name = data.azurerm_resource_group.chatbot_rg.name
  zone_name           = azurerm_dns_zone.chatbot_dns.name
  ttl                 = 300
  # target_resource_id  = azurerm_public_ip.frontend.id
}

output "dns_zone_id" {
  value = azurerm_dns_zone.chatbot_dns.id
}