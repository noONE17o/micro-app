output "instance_name" {
  description = "The name of the SQL instance."
  value       = google_sql_database_instance.mysql_instance.name
}

output "db_instance_private_ip" {
  value = google_sql_database_instance.mysql_instance.private_ip_address
}

output "db_user" {
  value = google_sql_user.mysql_user.name
}

output "db_password" {
  value = var.db_password
}