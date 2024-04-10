resource "azurerm_private_dns_zone" "example" {
  name                = "example.postgres.database.azure.com"
  resource_group_name = data.azurerm_resource_group.chachat_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "chachat_vnetlink" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = data.azurerm_virtual_network.chachat_vnet.id
  resource_group_name   = data.azurerm_resource_group.chachat_rg.name
}

resource "azurerm_dns_zone" "chachat_dnsputa que pariu" {
  name                = ""
  resource_group_name = data.azurerm_resource_group.chachat_rg.name
}

resource "azurerm_dns_a_record" "dns_a_frontend" {
  name                = "frontend"
  resource_group_name = data.azurerm_resource_group.chachat_rg.name
  zone_name           = azurerm_dns_zone.main.name
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.frontend.id
}

# resource "azurerm_dns_a_record" "backend" {
#   name = "backend"
#   resource_group_name = data.azurerm_resource_group.chachat_rg.name
#   zone_name = azurerm_dns_zone.main.name
#   ttl = 300
#   target_resource_id = azurerm_public_ip.backend.id
# }

output "dns_zone_id" {
  value = azurerm_dns_zone.main.id
}