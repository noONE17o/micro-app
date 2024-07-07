output "dashboard_id" {
  description = "The ID of the created dashboard."
  value       = google_monitoring_dashboard.my_dashboard.id
}

output "alert_policy_id" {
  description = "The ID of the created alert policy."
  value       = google_monitoring_alert_policy.high_cpu_alert.id
}
