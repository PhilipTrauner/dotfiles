#!/bin/bash

set -e

export PATH="$HOME/.cargo/bin:$PATH"

if ! [ -x "$(command -v alacritty)" ]; then
	cargo install --git https://github.com/jwilm/alacritty --branch scrollback
fi

sudo pip3 install pipenv
yarn global add i3-style
