
# variables:
#   tailscale_tags  list(string)
#   tailscale_key_expiry  numer 3600
#   machine_type    string        n1-standard-1
#

# Generate Tailscale auth key
resource "tailscale_tailnet_key" "self" {
  reusable      = true
  ephemeral     = true
  preauthorized = true
  expiry        = var.tailscale_key_expiry
  tags          = var.tailscale_tags
}

#
# [ Tailscale Server ]
#
#tfsec:ignore:google-compute-enable-shielded-vm-vtpm
#tfsec:ignore:google-compute-enable-shielded-vm-im
#tfsec:ignore:google-compute-vm-disk-encryption-customer-key
resource "google_compute_instance" "tailscale" {
  #checkov:skip=CKV_GCP_38
  #checkov:skip=CKV_GCP_30:"Ensure that instances are not configured to use the default service account"
  #checkov:skip=CKV_GCP_39:"Ensure Compute instances are launched with Shielded VM enabled"

  allow_stopping_for_update = true
  description               = var.instance_description
  labels                    = var.instance_labels
  machine_type              = var.machine_type
  name                      = var.name
  tags                      = var.instance_tags
  zone                      = var.zone

  boot_disk {
    initialize_params {
      image = var.boot_image
      #labels = {}
      #size =
      #type =
    }
  }

  metadata = {
    block-project-ssh-keys = true
  }
  metadata_startup_script = templatefile("${path.module}/templates/install.sh.ubuntu.tpl",
    {
      repository_key       = var.tailscale_repo_key
      repository_list      = var.tailscale_repo_list
      subnets_to_advertise = var.subnetwork_cidr_ip_blocks
      tailscale_auth_key   = tailscale_tailnet_key.self.key
    }
  )

  network_interface {
    # Names or self links
    network    = var.vpc_network_name
    subnetwork = var.vpc_subnetwork_name
  }

  # Why??
  provisioner "local-exec" {
    command = "sleep 60"
  }
}
