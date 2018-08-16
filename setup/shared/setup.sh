#!/bin/bash

set -e

# git lfs is "special"
git lfs install

# Install antigen (zsh plugin manager)
mkdir -p ~/.antigen
curl -L git.io/antigen > ~/.antigen/antigen.zsh

export PATH="$HOME/.cargo/bin:$PATH"

# Install rustup
if ! [ -x "$(command -v rustup)" ]; then
	wget -O rustup.sh https://sh.rustup.rs
	chmod +x rustup.sh
	./rustup.sh -y --no-modify-path --default-toolchain stable
	rm rustup.sh
fi

rustup update

mkdir -p ~/.antigen/completions
rustup completions zsh > ~/.antigen/completions/_rustup
ln -sf ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/share/zsh/site-functions/_cargo ~/.antigen/completions/_cargo
