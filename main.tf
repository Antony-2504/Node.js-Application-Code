terraform {
  backend "gcs" {
    bucket  = "tera02"
    prefix  = "terraform/state"
  }
}

provider "google" {
  credentials = file("/workspace/secrets/tera_sec.json")
  project     = "able-river-419007"
  region      = "us-central1"
}

resource "google_compute_instance" "demo12-instance" {
  name         = "demo12-instance"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

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

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    echo 'Hello, World!' > /var/www/html/index.html
    systemctl restart apache2
  EOF
}
