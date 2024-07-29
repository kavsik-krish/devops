
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

resource "google_container_cluster" "default" {
  name     = "default-cluster"
  location = "us-central1"
  initial_node_count = 3
  node_config {
    machine_type = "e2-medium"
  }
  master_auth {
    username = "admin"
  }
  network = "default"
  subnetwork = "projects/gcp-project-id/regions/us-central1/subnetworks/default"
}
