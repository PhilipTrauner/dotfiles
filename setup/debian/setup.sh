#!/bin/bash

set -e

# Create default directory tree
mkdir -p ~/Developer/scripts ~/Developer/chroots ~/Developer/clones \
	~/Developer/debs ~/Developer/testing ~/Downloads ~/Infinite


sudo dpkg --add-architecture i386
sudo dpkg --add-architecture armhf

# SSH agent setup
mkdir -p ~/.ssh
cat > ~/.ssh/config <<EOF
Host *
	AddKeysToAgent yes
	IdentityFile ~/.ssh/id_rsa
EOF

sudo apt-get update
sudo apt-get upgrade -y

sudo apt-get install -y curl wget apt-transport-https dirmngr

sudo ./setup/debian/signing-keys.sh
sudo ./setup/debian/repos.sh

sudo apt-get update

sudo ./setup/debian/networking-setup.sh

sudo apt-get install -y $(cat packages.txt | paste -s -d " ")
sudo apt-get autoremove

cp -r content/debian/dotfiles/. ~/
cp -r content/shared/dotfiles/. ~/
cp -r content/debian/scripts/. ~/Developer/scripts

sudo chsh -s $(which zsh) "$USER"

./setup/shared/setup.sh
./setup/debian/groups.sh
./setup/debian/custom-package-managers.sh
./setup/debian/git-repos.sh
./setup/debian/chroots.sh

sudo cp -r content/debian/overlay/* /

./setup/debian/desktop-env.sh
./setup/debian/grub.sh