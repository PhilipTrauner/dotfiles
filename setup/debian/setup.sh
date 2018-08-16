#!/bin/bash

set -e

. utils.sh

ask_details

# Create default directory tree
mkdir -p ~/Developer/scripts ~/Developer/chroots ~/Developer/clones \
	~/Developer/debs ~/Developer/testing ~/Downloads ~/Infinite


# SSH agent setup
mkdir -p ~/.ssh
cat > ~/.ssh/config <<EOF
Host *
	AddKeysToAgent yes
	IdentityFile ~/.ssh/id_rsa
EOF

sudo ./setup/debian/apt.sh

renew_sudo # Renew sudo timestamp

[[ -v SKIP_NETWORKING ]] || sudo ./setup/debian/networking-setup.sh

cp -r content/debian/dotfiles/. ~/
cp -r content/shared/dotfiles/. ~/
cp -r content/debian/scripts/. ~/Developer/scripts

./setup/shared/setup.sh
ln -sf ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/zsh/site-functions/_cargo ~/.antigen/completions/_cargo

sudo chsh -s $(which zsh) "$USER"

./setup/debian/groups.sh
./setup/debian/custom-package-managers.sh
[[ -v QUICK ]] || ./setup/debian/git-repos.sh
[[ -v QUICK ]] || ./setup/debian/chroots.sh

renew_sudo 
sudo cp -r content/debian/overlay/* /

sudo -H ./setup/debian/install-debs.sh

sudo ./setup/debian/alternatives.sh

renew_sudo
./setup/debian/desktop-env.sh

renew_sudo
sudo update-grub
