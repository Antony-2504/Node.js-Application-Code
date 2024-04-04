variable "instance_name" {
  description = "Name of the GCP instance"
  type        = string
  default     = "demo12-instance"
}

variable "machine_type" {
  description = "Machine type for the GCP instance"
  type        = string
  default     = "e2-medium"
}

variable "zone" {
  description = "Zone for the GCP instance"
  type        = string
  default     = "us-central1-a"
}

variable "startup_script" {
  description = "Startup script for the GCP instance"
  type        = string
  default     = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    echo 'Vanakkam da Mapla!' > /var/www/html/index.html
    systemctl restart apache2
  EOF
}
