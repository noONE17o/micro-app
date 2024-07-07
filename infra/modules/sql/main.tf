resource "google_sql_database_instance" "mysql_instance" {
  name             = "mysql-instance"
  database_version = "MYSQL_8_0"
  region           = var.region

  settings {
    tier = "db-f1-micro"
    ip_configuration {
      ipv4_enabled    = false
      private_network = var.network
    }
  }
}

resource "google_sql_database" "mysql_db" {
  name     = "my-app-db"
  instance = google_sql_database_instance.mysql_instance.name
}

resource "google_sql_user" "mysql_user" {
  name     = "db-user"
  instance = google_sql_database_instance.mysql_instance.name
  password = var.db_password
}


