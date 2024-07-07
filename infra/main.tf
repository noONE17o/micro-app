provider "google" {
  project = var.project_id
  region  = var.region
}

module "network" {
  source     = "./modules/network"
  project_id = var.project_id
  region     = var.region
}

module "service_accounts" {
  source     = "./modules/service_accounts"
  project_id = var.project_id
}

module "gke" {
  source                   = "./modules/gke"
  project_id               = var.project_id
  region                   = var.region
  network                  = module.network.network
  subnets                  = module.network.subnets
  service_account_email    = module.service_accounts.gke_service_account_email
}

module "sql" {
  source     = "./modules/sql"
  project_id = var.project_id
  region     = var.region
  network    = module.network.network
  subnets    = module.network.subnets
  db_password = var.db_password
}

module "monitoring" {
  source     = "./modules/monitoring"
  project_id = var.project_id
  region     = var.region
}

output "gke_cluster_name" {
  value = module.gke.cluster_name
}

output "gke_cluster_endpoint" {
  value = module.gke.endpoint
}

output "sql_instance_name" {
  value = module.sql.instance_name
}
