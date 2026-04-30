output "metabase_url" {
  value = "http://${google_compute_instance.vm.network_interface[0].access_config[0].nat_ip}:3000"
}

output "compose_debug" {
  value = file("${path.module}/docker/docker-compose.yaml")
}