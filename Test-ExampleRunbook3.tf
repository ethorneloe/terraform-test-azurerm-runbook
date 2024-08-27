module "Runbook3" {
  source = "git::https://github.com/ethorneloe/terraform-azurerm-automation-runbook.git?ref=feature-toggle-schedules-without-az-rest"

  subscription_id = data.azurerm_subscription.current.subscription_id
  resource_group_name = data.azurerm_resource_group.existing.name
  automation_account_name = data.azurerm_automation_account.existing.name
  automation_account_resource_id = data.azurerm_automation_account.existing.id
  location = var.location

  runbook = {
    name         = "Test-ExampleRunbook3"
    description  = "First example runbook"
    content      = file("./azure-runbooks/Test-ExampleRunbook3.ps1")
    log_verbose  = true
    log_progress = true
    runbook_type = "PowerShell72"
  }

  schedules = [
    {
      name        = "Runbook3-Daily1"
      frequency   = "Day"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook3-Daily1"
      enabled     = true
      run_on      = ""
    },
    {
      name        = "Runbook3-Daily2"
      frequency   = "Day"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook3-Daily2"
      enabled     = true
      run_on      = ""
    },
    {
      name        = "Runbook3-Weekly1"
      frequency   = "Week"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook3-Weekly1"
      enabled     = true
      run_on      = ""
    },
    {
      name        = "Runbook3-Weekly2"
      frequency   = "Week"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook3-Weekly2"
      week_days   = ["Monday", "Friday"]
      run_on      = ""
    },
    {
      name        = "Runbook3-Weekly3"
      frequency   = "Week"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook3-Weekly3"
      week_days   = ["Tuesday", "Friday"]
      run_on      = ""
    }
  ]

  automation_variables = [
    {
      name      = "Runbook3-Environment"
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
