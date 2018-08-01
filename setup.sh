#!/bin/bash

set -e

if [[ $EUID -eq 0 ]]; then
	echo "This script should not be run as root." 1>&2
	exit 1
fi

# Change working directory to script location
cd "$(dirname "$0")"

. utils.sh

os_detect setup/mac-os/setup.sh setup/debian/setup.sh