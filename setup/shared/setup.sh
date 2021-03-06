#!/bin/bash

set -e

# git lfs is "special"
git lfs install

# Install antigen (zsh plugin manager)
mkdir -p ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh

export PATH="$HOME/.cargo/bin:$HOME/.poetry/bin:$PATH"

# Install rustup
if ! [ -x "$(command -v rustup)" ]; then
	wget -O rustup.sh https://sh.rustup.rs
	chmod +x rustup.sh
	./rustup.sh -y --no-modify-path --default-toolchain stable
	rm rustup.sh
fi

# Install poetry
if ! [ -x "$(command -v poetry)" ]; then
	wget -O poetry.py https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py
	yes "n" | python get-poetry.py --preview
	rm poetry.py
fi

rustup self update

mkdir -p ~/.antigen/completions
rustup completions zsh > ~/.antigen/completions/_rustup
poetry completions > ~/.antigen/completions/_poetry