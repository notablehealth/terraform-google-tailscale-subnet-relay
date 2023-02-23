
#data "google_compute_network" "tailscale" {
#  name    = var.vpc_network_name
#  project = var.gcloud_project
#}

#locals {
#  # get a single subnet
#  subnet_self_link = one([for item in data.google_compute_network.tailscale.subnetworks_self_links : item if can(regex(var.vpc_subnetwork_name, item))])
#}
#ata "google_compute_subnetwork" "tailscale" {
# self_link = local.subnet_self_link
# # or name ? project, zone
# # name = var.vpc_subnetwork_name
#
# .ip_cidr_range
