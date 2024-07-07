output "gke_cluster_name" {
  description = "The name of the GKE cluster."
  value       = module.gke.cluster_name
}

output "gke_cluster_endpoint" {
  description = "The endpoint of the GKE cluster."
  value       = module.gke.endpoint
}

output "gke_cluster_ca_certificate" {
  value = module.gke.kubernetes_cluster_ca_certificate
}

output "sql_instance_name" {
  description = "The name of the SQL instance."
  value       = module.sql.instance_name
}

output "db_instance_address" {
  value = module.sql.db_instance_address
}


