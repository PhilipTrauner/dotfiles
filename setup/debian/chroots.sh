#!/bin/bash

set -e

cd ~/Developer/chroots

export PATH="$HOME/Developer/scripts:$PATH"

if [ ! -d arch-none-amd64-main ]; then
	arch-bootstrap.sh -a x86_64 -r "http://mirror.reisenbauer.ee/archlinux/" arch-none-amd64-main
fi

if [ ! -d debian-stretch-amd64-base ]; then
	sudo debootstrap --verbose --arch=amd64 stretch ./debian-stretch-amd64-base
	sudo cp ~/Developer/scripts/setup-debian-chroot.sh debian-stretch-amd64-base
	sudo chroot debian-stretch-amd64-base/ ./setup-debian-chroot.sh
fi

if [ ! -d debian-stretch-amd64-main ]; then
	sudo cp -rp debian-stretch-amd64-base debian-stretch-amd64-main
fi



