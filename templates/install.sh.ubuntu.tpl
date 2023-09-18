#!/bin/bash

#  https://www.shellcheck.net/wiki/SC2154 -- repository_key is referenced but ...
#  https://www.shellcheck.net/wiki/SC2174 -- When used with -p, -m only applie...
#  https://www.shellcheck.net/wiki/SC2086 -- Double quote to prevent globbing ...
#shellcheck disable=SC2154,SC2174,SC2086

echo "Installing Tailscale"

### Ubuntu
mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL ${repository_key} | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL ${repository_list} | sudo tee /etc/apt/sources.list.d/tailscale.list

apt-get -y update
apt-get -y install tailscale

systemctl enable --now tailscaled

# enable ip forwarding for advertising subnets
# https://tailscale.com/kb/1023/troubleshooting#why-do-i-get-an-error-about-ip-forwarding-when-using-advertise-routes
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sysctl -p /etc/sysctl.conf

# https://tailscale.com/kb/1019/subnets
# https://tailscale.com/kb/1147/cloud-gce/
sudo resolvectl default-route tailscale0 no
tailscale up --authkey=${tailscale_auth_key} --advertise-routes=${subnets_to_advertise}
