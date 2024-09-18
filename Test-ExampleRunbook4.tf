module "Runbook4" {
  source = "git::https://github.com/ethorneloe/terraform-azurerm-automation-runbook.git?ref=v2.0.0"

  resource_group_name = data.azurerm_resource_group.existing.name
  automation_account_name = data.azurerm_automation_account.existing.name
  location = var.location
  timezone = var.automation_schedule_timezone

  runbook = {
    name         = "Test-ExampleRunbook4"
    description  = "First example runbook"
    content      = file("./azure-runbooks/Test-ExampleRunbook4.ps1")
    log_verbose  = true
    log_progress = true
    runbook_type = "PowerShell72"
  }

  automation_variables = [
    {
      name      = "Runbook4-Environment"
      value     = "Production"
      type      = "string"
      encrypted = false
    }
  ]

  tags = {
    "Environment" = "Production"
    "ManagedBy"   = "Terraform"
    "Project"     = "Automation"
  }
}
