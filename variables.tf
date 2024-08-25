variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "terraform-labs"
}

variable "automation_account_name" {
  description = "The name of the automation account"
  default     = "terraform-testing"
}

variable "location" {
  description = "The Azure region for the automation account"
  default     = "australiaeast"
}