variable "project_id" {
  description = "The ID of the project to deploy to"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = "my-vpc-network"
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster"
  type        = string
}

variable "db_password" {
  description = "The password for the SQL database"
  type        = string
  sensitive   = true
}

variable "notification_channel_id" {
  description = "The ID of the notification channel to use for alerts"
  default = "17782734381812390268"
  type        = string
}
