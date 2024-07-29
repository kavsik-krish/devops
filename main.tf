
# Configure the Google Cloud Provider
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  credentials = file("keys.json")
  project     = "abc"
}

# Google Kubernetes Engine
resource "google_container_cluster" "basic_cluster" {
  name               = "basic-cluster"
  location           = "us-central1"
  initial_node_count = 1
  node_config {
    machine_type = "e2-medium"
  }
  network            = "default"
}
