#!/bin/bash

set -e

cd ~/Dropbox/VPN

sudo -b openvpn --config mullvad_se-sto.conf >/dev/null 2>&1
