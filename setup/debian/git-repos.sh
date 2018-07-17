#!/bin/bash

set -e

function clone_or_fetch {
	GIT_REPO="$1"
	GIT_REPO_ARR=(${GIT_REPO//\// })
	if [ ! -d "${GIT_REPO_ARR[1]}" ]; then
		git clone --depth=1 https://github.com/"$GIT_REPO"
	else
		git -C "${GIT_REPO_ARR[1]}" fetch --all
		git -C "${GIT_REPO_ARR[1]}" reset --hard origin/master
	fi
}

mkdir -p repos

cd repos

clone_or_fetch "buzz/volctl"

cd volctl

sudo ./setup.py install
sudo update-desktop-database
sudo glib-compile-schemas /usr/local/share/glib-2.0/schemas/

cd ..

clone_or_fetch "PhilipTrauner/arch-bootstrap"

mkdir -p ~/Developer/scripts
cp arch-bootstrap/arch-bootstrap.sh ~/Developer/scripts
chmod +x ~/Developer/scripts/arch-bootstrap.sh

cd ..
