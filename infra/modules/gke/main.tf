resource "google_container_cluster" "primary" {
  name               = "primary-cluster"
  location           = var.region
  network            = var.network
  remove_default_node_pool = true
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    service_account = var.service_account_email
  }
  private_cluster_config {
    enable_private_nodes = true
    enable_private_endpoint = false
    master_ipv4_cidr_block = "10.0.0.0/28"
  }
}

resource "google_container_node_pool" "frontend_pool" {
  cluster    = google_container_cluster.primary.name
  node_count = 2
  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    service_account = var.service_account_email
  }
}

resource "google_container_node_pool" "backend_pool" {
  cluster    = google_container_cluster.primary.name
  node_count = 2
  node_config {
    machine_type = "e2-medium"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    service_account = var.service_account_email
  }
}

