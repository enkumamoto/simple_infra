#########################
# Azure Cloud Variables #
#########################
variable "chatbot_project_rg" {
  type = string
}

variable "location" {
  type = string
}

variable "chatbot_project_vnet" {
  type = string
}

variable "chatbot_project_nsg" {
  type = string
}

variable "chatbot_project_domain_name" {
  type = string
}

variable "chatbot_project_rt" {
  type = string
}

variable "chatbot_project_sbnt" {
  type = string
}

############################
# Azure Database Variables #
############################
variable "administrator_login" {
  type = string
}

variable "administrator_password" {
  type = string
}

variable "chatbot_project_db_name" {
  type = string
}

#######################
# Azure ACR Variables #
#######################
variable "chatbot_acr_name" {
  type = string
}

##############################
# Azure App Serive Variables #
##############################
variable "app_name" {
  type = map(string)
  default = {
    "1" = "frontend",
    "2" = "backend",
    "3" = "model-service",
  }
}

variable "app_image_name" {
  type = map(string)
  default = {
    "1" = "frontend",
    "2" = "backend",
    "3" = "model-service",
  }
}