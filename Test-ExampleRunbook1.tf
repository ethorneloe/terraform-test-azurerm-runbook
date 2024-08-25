# Secrets
variable "secret1" {
  type        = string
  description = "Secret variable from GitHub Secrets"
  sensitive   = true
}

module "runbook1" {
  source = "./modules/runbook_module"

  resource_group_name = var.resource_group_name
  automation_account_name = var.automation_account_name
  location = var.location

  runbook = {
    name         = "Test-ExampleRunbook1"
    description  = "First example runbook"
    content      = file("./azure-runbooks/Test-ExampleRunbook1.ps1")
    log_verbose  = true
    log_progress = true
    runbook_type = "PowerShell72"
  }

  schedules = [
    {
      name        = "Runbook1-Daily1"
      frequency   = "Day"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook1-Daily1"
      enabled     = false
      run_on      = ""
    },
    {
      name        = "Runbook1-Daily2"
      frequency   = "Day"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook1-Daily2"
      enabled     = false
      run_on      = ""
    },
    {
      name        = "Runbook1-Weekly1"
      frequency   = "Week"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook1-Weekly1"
      enabled     = true
      run_on      = ""
    },
    {
      name        = "Runbook1-Weekly2"
      frequency   = "Week"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook1-Weekly2"
      week_days   = ["Monday", "Friday"]
      run_on      = ""
    },
    {
      name        = "Runbook1-Weekly3"
      frequency   = "Week"
      interval    = 1
      start_time  = "2024-09-09T01:00:00Z"
      description = "Runbook1-Weekly3"
      week_days   = ["Tuesday", "Friday"]
      run_on      = ""
    }
  ]

  automation_variables = [
    {
      name      = "Runbook1-Secret"
      value     = var.secret1
      type      = "string"
      encrypted = true
    },
    {
      name      = "Runbook1-Environment"
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
