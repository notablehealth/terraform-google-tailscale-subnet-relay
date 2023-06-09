
output "id" {
  description = "Identifier for the instance with format projects/{{project}}/zones/{{zone}}/instances/{{name}}"
  value       = google_compute_instance.tailscale.id
}
output "instance_id" {
  description = "Server-assigned unique identifier of instance"
  value       = google_compute_instance.tailscale.instance_id
}
output "instance_name" {
  description = "The name of the instance"
  value       = google_compute_instance.tailscale.name
}
output "network_ip" {
  description = "The private IPv4 address assigned to the instance"
  value       = google_compute_instance.tailscale.network_interface[0].network_ip
}
output "self_link" {
  description = "URI of the instance"
  value       = google_compute_instance.tailscale.self_link
}
