terraform {
  backend "gcs" {
    bucket  = "tera02"
    prefix  = "terraform/state/demo-instance"
  }
}

provider "google" {
  credentials = file("/workspace/secrets/tera_sec.json")
  project     = "able-river-419007"
  region      = "us-central1"
}

resource "google_compute_instance" "demo12-instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }

  metadata_startup_script = var.startup_script
}
