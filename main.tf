provider "google" {
  credentials = jsondecode(var.my_credentials)
  project     = "able-river-419007"
  region      = "us-central1"
}

variable "my_credentials" {
  type    = string
  default = ""
}

resource "google_compute_instance" "demo-instance" {
  name         = "demo-instance"
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

  metadata_startup_script = "echo 'Hello, World!' > /var/www/html/index.html && sudo service apache2 restart"
}
