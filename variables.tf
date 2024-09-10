variable "location" {
  description = "The Azure region for the automation account"
  default     = "australiaeast"
}

variable "automation_schedule_timezone" {
  description = "The timezone for schedules"
  default     = "Australia/Brisbane"
}