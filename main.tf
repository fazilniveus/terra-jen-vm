resource "google_compute_instance" "vm01" {
  name         = var.vm01
  machine_type = "e2-medium"
  zone         = "asia-south1-c"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  // Apply the firewall rule to allow external IPs to access this instance
  tags = ["http-server", "https-server"]
}

resource "google_compute_firewall" "http-server" {
  name    = var.fw01
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server", "https-server"]
}
resource "google_compute_network" "vpc01" {
  name = var.vpc01
}
