#!/bin/bash

set -e

apt-get remove -y ifupdown || echo "ifupdown already removed!"

cat << EOF > /etc/systemd/network/dhcp.network
[Match]
Name=en*

[Network]
DHCP=yes
EOF

systemctl stop networking || echo "networking.service already removed!"
systemctl enable systemd-networkd
systemctl start systemd-networkd
