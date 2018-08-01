#!/bin/bash

set -e

dpkg --add-architecture i386
dpkg --add-architecture armhf

apt-get update
apt-get upgrade -y

apt-get install -y curl wget apt-transport-https dirmngr

./setup/debian/signing-keys.sh
./setup/debian/repos.sh

apt-get update

apt-get install -y $(cat packages.txt | paste -s -d " ")
apt-get autoremove