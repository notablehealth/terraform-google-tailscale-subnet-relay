
output "id" {
  description = "Identifier for the instance with format projects/{{project}}/zones/{{zone}}/instances/{{name}}"
  value       = google_compute_instance.tailscale.id
}
output "instance_id" {
  description = "Server-assigned unique identifier of instance"
  value       = google_compute_instance.tailscale.instance_id
}
output "self_link" {
  description = "URI of the instance"
  value       = google_compute_instance.tailscale.self_link
}
