# Demonstrates the declaration of a secret that is sensitive and then using the value for ot later in the automation variable section.
# The value is picked up through the tfvars environment variable, which could also be set in env in the GitHub workflow.
# variable "secret2" {
#   type        = string
#   description = "Secret variable from GitHub Secrets"
#   sensitive   = true
# }

module "Runbook2" {
  source = "git::https://github.com/ethorneloe/terraform-azurerm-automation-runbook.git?ref=v2.0.0"

  resource_group_name = data.azurerm_resource_group.existing.name
  automation_account_name = data.azurerm_automation_account.existing.name
  location = var.location
  timezone = var.automation_schedule_timezone

  runbook = {
    name         = "Test-ExampleRunbook2"
    description  = "First example runbook"
    content      = file("./azure-runbooks/Test-ExampleRunbook2.ps1")
    log_verbose  = true
    log_progress = true
    runbook_type = "PowerShell72"
  }

  schedules = [
    {
      name        = "Runbook2-Daily"
      frequency   = "Day"
      interval    = 1
      start_time  = "2024-09-19T01:00:00+10:00"
      description = "Runbook2-Daily1"
      enabled     = true
      run_on      = ""
    },
    {
      name        = "Runbook2-Daily2"
      frequency   = "Day"
      interval    = 1
      start_time  = "2024-09-19T01:00:00+10:00"
      description = "Runbook2-Daily2"
      enabled     = true
      run_on      = ""
    },
    {
      name        = "Runbook2-Weekly1"
      frequency   = "Week"
      interval    = 1
      start_time  = "2024-09-19T01:00:00+10:00"
      description = "Runbook2-Weekly1"
      enabled     = false
      run_on      = ""
    },
    {
      name        = "Runbook2-Weekly2"
      frequency   = "Week"
      interval    = 1
      start_time  = "2024-09-19T01:00:00+10:00"
      description = "Runbook2-Weekly2"
      week_days   = ["Monday", "Friday"]
      run_on      = ""
    },
    {
      name        = "Runbook2-Weekly3"
      frequency   = "Week"
      interval    = 1
      start_time  = "2024-09-19T01:00:00+10:00"
      description = "Runbook2-Weekly3"
      week_days   = ["Tuesday", "Friday"]
      run_on      = ""
    }
  ]

  automation_variables = [
    #
    # name      = "Runbook2-Secret"
    # value     = var.secret2
    # type      = "string"
    # encrypted = true
    #,
    {
      name      = "Runbook2-Environment"
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
