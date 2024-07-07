variable "project_id" {
  description = "The project ID to deploy resources."
  type        = string
}

variable "region" {
  description = "The region to deploy resources."
  type        = string
}

variable "network" {
  description = "The network to deploy the GKE cluster."
  type        = string
}

variable "subnets" {
  description = "The subnets to deploy the GKE cluster."
  type        = map(string)
}

variable "service_account_email" {
  description = "The email of the service account to use for GKE nodes."
  type        = string
}
