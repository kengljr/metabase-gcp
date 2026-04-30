resource "google_compute_instance" "vm" {
  name         = "metabase-server"
  machine_type = "e2-medium"

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
  metadata_startup_script = templatefile("${path.module}/scripts/startup.sh", {
  compose = file("${path.module}/docker/docker-compose.yaml")
})
  tags = ["metabase"]
  
}

resource "google_compute_firewall" "allow_metabase" {
  name    = "allow-metabase"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["3000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["metabase"]
}

