#!/bin/bash

set -e
shopt -s dotglob

sudo apt-get install -y apt-transport-https curl

# Upgrade to testing release channel
sudo sh -c "cat << EOF > /etc/apt/sources.list
deb http://ftp.at.debian.org/debian/ testing main contrib non-free
deb-src http://ftp.at.debian.org/debian/ testing main contrib non-free

deb http://security.debian.org/debian-security testing/updates main contrib non-free
deb-src http://security.debian.org/debian-security testing/updates main contrib non-free

deb http://ftp.at.debian.org/debian/ testing-updates main contrib non-free
deb-src http://ftp.at.debian.org/debian/ testing-updates main contrib non-free

deb http://ftp.at.debian.org/debian experimental main contrib non-free
EOF"

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

# git lfs
curl -L https://packagecloud.io/github/git-lfs/gpgkey | sudo apt-key add -

# Install git-lfs
sudo sh -c "cat << EOF > /etc/apt/sources.list.d/github_git-lfs.list
deb https://packagecloud.io/github/git-lfs/debian/ buster main
deb-src https://packagecloud.io/github/git-lfs/debian/ buster main
EOF"

sudo apt-get update
sudo apt-get install -y git-lfs

# git lfs is "special"
git lfs install

git lfs checkout || echo "Checkout failed, continuing anyway..."

mkdir -p ~/Developer/setup
mv ./* ~/Developer/setup