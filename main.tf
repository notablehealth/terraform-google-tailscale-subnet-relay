
# Generate Tailscale auth key
resource "tailscale_tailnet_key" "self" {
  reusable      = true
  ephemeral     = true
  preauthorized = true
  expiry        = var.tailscale_key_expiry
  tags          = var.tailscale_tags
}

# TODO:
#   create encryption key
#   add for disk encryption
#
# [ Tailscale Server ]
#
#tfsec:ignore:google-compute-vm-disk-encryption-customer-key
resource "google_compute_instance" "tailscale" {
  #checkov:skip=CKV_GCP_30:Ensure that instances are not configured to use the default service account
  #checkov:skip=CKV_GCP_38:Ensure boot disks for instances use Customer-Supplied Encryption Keys

  allow_stopping_for_update = true
  description               = var.instance_description
  labels                    = var.instance_labels
  machine_type              = var.machine_type
  name                      = var.name
  tags                      = var.instance_tags
  zone                      = var.zone
  shielded_instance_config {
    # Image must support
    enable_integrity_monitoring = true
    enable_secure_boot          = true
    enable_vtpm                 = true
  }

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
  #service_account {}

  # Why??
  provisioner "local-exec" {
    command = "sleep 60"
  }
}
