# terraform-google-tailscale-subnet-relay

[![Releases](https://img.shields.io/github/v/release/notable-health/terraform-google-tailscale-subnet-relay)](https://github.com/notable-health/terraform-google-tailscale-subnet-relay/releases)

[Terraform Module Registry](https://registry.terraform.io/modules/notable-health/tailscale-subnet-relay/google)

Terraform module to manage a Tailscale subnet relay instance on GCP

## Features

- generates auth key for device login
- manages a GCP instance runnng tailscale

## Usage

Copy contents or create new repository on GitHub and use this as a template

```hcl
module "tailscale-subnet-relay" {
  source  = "notable-health/tailscale-subnet-relay/google"
  # Recommend pinning every module to a specific version
  # version = "x.x.x"

}
```

### Set Tailscale authorization via environment variables

- TAILSCALE_API_KEY
- TAILSCALE_TAILNET

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.53.1 |
| <a name="requirement_tailscale"></a> [tailscale](#requirement\_tailscale) | 0.13.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.54.0 |
| <a name="provider_tailscale"></a> [tailscale](#provider\_tailscale) | 0.13.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_instance.tailscale](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [tailscale_tailnet_key.self](https://registry.terraform.io/providers/tailscale/tailscale/0.13.6/docs/resources/tailnet_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_boot_image"></a> [boot\_image](#input\_boot\_image) | GCP instance boot image | `string` | `"ubuntu-os-cloud/ubuntu-2204-lts"` | no |
| <a name="input_instance_description"></a> [instance\_description](#input\_instance\_description) | DCP instance description | `string` | `"Tailscale subnet relay"` | no |
| <a name="input_instance_labels"></a> [instance\_labels](#input\_instance\_labels) | Label key/pairs to assign to instance | `map(any)` | `{}` | no |
| <a name="input_instance_tags"></a> [instance\_tags](#input\_instance\_tags) | List of tags to assign to instance | `list(string)` | `[]` | no |
| <a name="input_machine_type"></a> [machine\_type](#input\_machine\_type) | GCP instance machine type | `string` | `"n1-standard-1"` | no |
| <a name="input_name"></a> [name](#input\_name) | GCP instance name | `string` | `"tailscale"` | no |
| <a name="input_subnetwork_cidr_ip_blocks"></a> [subnetwork\_cidr\_ip\_blocks](#input\_subnetwork\_cidr\_ip\_blocks) | List of subnet cidrs to route (, separated) | `string` | `""` | no |
| <a name="input_tailscale_key_expiry"></a> [tailscale\_key\_expiry](#input\_tailscale\_key\_expiry) | Expiration of Tailscale authentication key in seconds | `number` | `3600` | no |
| <a name="input_tailscale_repo_key"></a> [tailscale\_repo\_key](#input\_tailscale\_repo\_key) | Tailscale package repository GPG key | `string` | `"https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg "` | no |
| <a name="input_tailscale_repo_list"></a> [tailscale\_repo\_list](#input\_tailscale\_repo\_list) | Tailscale package repository list | `string` | `"https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list"` | no |
| <a name="input_tailscale_tags"></a> [tailscale\_tags](#input\_tailscale\_tags) | List Tailscale tags | `list(string)` | `[]` | no |
| <a name="input_vpc_network_name"></a> [vpc\_network\_name](#input\_vpc\_network\_name) | VPC network name where tailscale instance will be placed | `string` | n/a | yes |
| <a name="input_vpc_subnetwork_name"></a> [vpc\_subnetwork\_name](#input\_vpc\_subnetwork\_name) | VPC subnet name where tailscale instance will be placed | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | GCP zone where tailscale instance will be placed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Identifier for the instance with format projects/{{project}}/zones/{{zone}}/instances/{{name}} |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | Server-assigned unique identifier of instance |
| <a name="output_self_link"></a> [self\_link](#output\_self\_link) | URI of the instance |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
