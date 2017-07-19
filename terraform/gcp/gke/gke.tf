variable "zone" 	     { default = "us-east1-b" }

resource "google_container_cluster" "gke1" {
  name = "gke1"
  zone = "${var.zone}"
  initial_node_count = 2
  
  master_auth {
    username = "admin"
    password = "admin"
  }

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }
}
