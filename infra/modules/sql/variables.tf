variable "project_id" {
  description = "The project ID to deploy resources."
  type        = string
}

variable "region" {
  description = "The region to deploy resources."
  type        = string
}

variable "network" {
  description = "The network to deploy the SQL instance."
  type        = string
}

variable "subnets" {
  description = "The subnets to deploy the SQL instance."
  type        = map(string)
}

variable "db_password" {
  description = "The password for the MySQL database user."
  type        = string
  sensitive   = true
}
