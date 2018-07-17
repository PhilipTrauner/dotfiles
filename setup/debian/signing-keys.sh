#!/bin/bash

set -e

# Google
curl -sSf https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

# Spotify
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

# Sublime HQ
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -

# Typora
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE

# Microsoft
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

# NodeSource
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -

# git lfs
curl -L https://packagecloud.io/github/git-lfs/gpgkey | apt-key add -

# Yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

# Wine
curl -sL https://dl.winehq.org/wine-builds/Release.key | apt-key add -
