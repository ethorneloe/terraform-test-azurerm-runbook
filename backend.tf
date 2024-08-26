terraform {
  backend "azurerm" {
    resource_group_name   = "tfstate"
    storage_account_name  = "tfstatelab1"
    container_name        = "automation-account-testing"
    key                   = "terraform.tfstate"
    use_azuread_auth      = true
  }
}