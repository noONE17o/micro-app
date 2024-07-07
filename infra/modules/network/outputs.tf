output "network" {
  description = "The VPC network name."
  value       = google_compute_network.vpc_network.name
}

output "subnets" {
  description = "The subnets created."
  value       = {
    frontend = google_compute_subnetwork.frontend_subnet.name
    backend  = google_compute_subnetwork.backend_subnet.name
    database = google_compute_subnetwork.database_subnet.name
  }
}
