#!/bin/bash

set -e

# Upgrade to testing release channel
cat << EOF > /etc/apt/sources.list
deb http://ftp.at.debian.org/debian/ testing main contrib non-free
deb-src http://ftp.at.debian.org/debian/ testing main contrib non-free

deb http://security.debian.org/debian-security testing/updates main contrib non-free
deb-src http://security.debian.org/debian-security testing/updates main contrib non-free

deb http://ftp.at.debian.org/debian/ testing-updates main contrib non-free
deb-src http://ftp.at.debian.org/debian/ testing-updates main contrib non-free

deb http://ftp.at.debian.org/debian experimental main contrib non-free
EOF

# Chrome
echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

# Spotify
echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list

# Sublime Text
echo "deb https://download.sublimetext.com/ apt/stable/" > /etc/apt/sources.list.d/sublime-text.list

# Typora
echo "deb https://typora.io/linux ./" > /etc/apt/sources.list.d/typora.list

# Visual Studio Code
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

# NodeJS
cat << EOF > /etc/apt/sources.list.d/nodesource.list
deb https://deb.nodesource.com/node_10.x buster main
deb-src https://deb.nodesource.com/node_10.x buster main
EOF

# git lfs
cat << EOF > /etc/apt/sources.list.d/github_git-lfs.list
deb https://packagecloud.io/github/git-lfs/debian/ buster main
deb-src https://packagecloud.io/github/git-lfs/debian/ buster main
EOF

# Yarn
echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list

# Wine
echo "deb https://dl.winehq.org/wine-builds/debian/ testing main" > /etc/apt/sources.list.d/wine.list
