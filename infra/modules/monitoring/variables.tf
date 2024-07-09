variable "project_id" {
  description = "The project ID to deploy resources."
  type        = string
}

variable "region" {
  description = "The region to deploy resources."
  type        = string
}

variable "notification_channel_id" {
  description = "The ID of the notification channel to use for alerts"
  default = "17782734381812390268"
  type        = string
}
