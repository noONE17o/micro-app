output "gke_service_account_email" {
  description = "The email of the GKE service account."
  value       = google_service_account.gke_service_account.email
}
