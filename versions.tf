
terraform {
  required_version = ">= 1.3.7"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.53.1"
    }
    #google-beta = {
    #  source  = "hashicorp/google-beta"
    #  version = "4.53.1"
    #}
    tailscale = {
      source  = "tailscale/tailscale"
      version = "0.13.6"
    }
  }
}

###------------------
### Usage
###------------------

#provider "google" {
#  project     = "my-project-id"
#  region      = "us-central1"
#  zone        = "us-central1-c"
#}

#provider "google-beta" {
#  project = "my-project-id"
#  region  = "us-central1"
#  zone    = "us-central1-c"
#}

#provider "tailscale" {
#  # Configuration options - all optional
#  api_key = "my_api_key"  # Set with TAILSCALE_API_KEY environment variable.
#  tailnet = "example.com" # Set with TAILSCALE_TAILNET environment variable.
#}
