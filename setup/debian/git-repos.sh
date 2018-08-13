#!/bin/bash

set -e

function clone_or_fetch {
	GIT_REPO="$1"
	GIT_BRANCH="$2"
	GIT_REPO_ARR=(${GIT_REPO//\// })
	if [ ! -d "${GIT_REPO_ARR[1]}" ]; then
		git clone -b "${GIT_BRANCH}" --depth=1 https://github.com/"$GIT_REPO"
	else
		git -C "${GIT_REPO_ARR[1]}" fetch --all
		git -C "${GIT_REPO_ARR[1]}" reset --hard origin/"${GIT_BRANCH}"
	fi
}

mkdir -p repos

cd repos

clone_or_fetch "jwilm/alacritty" "scrollback"

cd alacritty

export PATH="$HOME/.cargo/bin:$PATH"

cargo install cargo-deb || echo "\"cargo-deb\" already installed!"
cp $(cargo deb) ~/Developer/debs

cd ..

clone_or_fetch "buzz/volctl" "master"

cd volctl

./setup.py install --user
sudo update-desktop-database
glib-compile-schemas ~/.local/share/glib-2.0/schemas/

cd ..

clone_or_fetch "PhilipTrauner/arch-bootstrap" "master"

mkdir -p ~/Developer/scripts
cp arch-bootstrap/arch-bootstrap.sh ~/Developer/scripts
chmod +x ~/Developer/scripts/arch-bootstrap.sh

clone_or_fetch "PhilipTrauner/rofi-calc" "master"

cd rofi-calc
autoreconf -i
mkdir -p build
cd build
../configure --prefix=$(realpath ~/.local)
make install
libtool --finish ~/.local/lib/rofi/

cd ../..