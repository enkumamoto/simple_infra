resource "time_sleep" "wait_60_seconds" {
  depends_on = [azurerm_container_registry.simple_infra_acr]
  create_duration = "60s"
}

resource "random_id" "app_service" {
 
  byte_length = 6
  
}
resource "azurerm_linux_web_app" "app-service" {
  for_each            = var.app_name
  name                = "${var.app_name[each.key]}-${random_id.app_service.hex}"
  location            = azurerm_service_plan.simple_infra_project_plan.location
  resource_group_name = data.azurerm_resource_group.simple_infra_project_rg.name
  service_plan_id     = azurerm_service_plan.simple_infra_project_plan.id
  https_only          = true

  app_settings = merge({
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = "https://${azurerm_container_registry.simple_infra_acr.login_server}"
    "DOCKER_REGISTRY_SERVER_USERNAME"     = azurerm_container_registry.simple_infra_acr.admin_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = azurerm_container_registry.simple_infra_acr.admin_password
    "DOCKER_CUSTOM_IMAGE_NAME"            = "${azurerm_container_registry.simple_infra_acr.login_server}/${var.app_image_name[each.key]}:latest"
  })

  site_config {
    application_stack {
      docker_image_name        = "${var.app_image_name[each.key]}:latest"
      docker_registry_url      = "https://${azurerm_container_registry.simple_infra_acr.login_server}"
      docker_registry_username = azurerm_container_registry.simple_infra_acr.admin_username
      docker_registry_password = azurerm_container_registry.simple_infra_acr.admin_password
    }
  }

  logs {
    application_logs {
      file_system_level = "Verbose"
    }
    http_logs {
      file_system {
        retention_in_days = 7
        retention_in_mb   = 35
      }
    }
  }
}