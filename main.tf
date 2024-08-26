provider "azurerm" {
  features {}
}

# Data source to access information about an existing resource group
data "azurerm_resource_group" "existing" {
  name = "terraform-labs"
}

# Data source to access information about an existing automation account
data "azurerm_automation_account" "existing" {
  name                = "terraform-testing"
  resource_group_name = data.azurerm_resource_group.existing.name
}