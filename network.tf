resource "azurerm_public_ip" "frontend_ip" {
  name                = "frontend-ip"
  resource_group_name = data.azurerm_resource_group.chachat_rg.name
  allocation_method   = "Static"
  domain_name_label   = "frontend"
}

# resource "azurerm_public_ip" "backend" {
#   name = "backend-ip"
#   resource_group_name = data.azurerm_resource_group.chachat_rg.name
#   allocation_method = "Static"
#   domain_name_label = "backend"
# }