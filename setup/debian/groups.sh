#!/bin/bash

set -e

groups=( kvm libvirt-qemu libvirt ) 
for group in "${groups[@]}"
do
	sudo adduser $USER $group
done