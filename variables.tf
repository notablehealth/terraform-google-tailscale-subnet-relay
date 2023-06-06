
#variable "validated" {
#  description = "String variable with validation"
#  type        = string
#  validation {
#    condition = contains(
#      ["one", "two", "three", "four"],
#      var.validated
#    )
#    error_message = "Must be one of: one, two, three, four."
#  }
#}

variable "boot_image" {
  description = "GCP instance boot image"
  type        = string
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}
#variable "gcloud_project" {
#  description = "GCP project ID"
#  type        = string
#}
variable "instance_description" {
  description = "DCP instance description"
  type        = string
  default     = "Tailscale subnet relay"
}
variable "instance_labels" {
  description = "Label key/pairs to assign to instance"
  type        = map(any)
  default     = {}
}
variable "instance_tags" {
  description = "List of tags to assign to instance"
  type        = list(string)
  default     = []
}
variable "machine_type" {
  description = "GCP instance machine type"
  type        = string
  default     = "n1-standard-1"

}
variable "name" {
  description = "GCP instance name"
  type        = string
  default     = "tailscale"
}
variable "project" {
  description = "GCP project ID"
  type        = string
}

variable "vpc_network_name" {
  description = "VPC network name where tailscale instance will be placed"
  type        = string
}

variable "vpc_subnetwork_name" {
  description = "VPC subnet name where tailscale instance will be placed"
  type        = string
}
# change to lookup, this as override
variable "subnetwork_cidr_ip_blocks" {
  description = "List of subnet cidrs to route (, separated)"
  type        = string
  default     = ""
}

variable "zone" {
  description = "GCP zone where tailscale instance will be placed"
  type        = string
}

###-------------
### Tailscale
###-------------
# keep as override instead of creating ??
#variable "tailscale_auth_key" {
#  type = string
#}
variable "tailscale_key_expiry" {
  description = "Expiration of Tailscale authentication key in seconds"
  type        = number
  default     = 3600
}
# These 2 must match the instance OS version (boot image)
variable "tailscale_repo_key" {
  description = "Tailscale package repository GPG key"
  type        = string
  default     = "https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg "
}
variable "tailscale_repo_list" {
  description = "Tailscale package repository list"
  type        = string
  default     = "https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list"
}
variable "tailscale_tags" {
  description = "List Tailscale tags"
  type        = list(string)
  default     = []
}
