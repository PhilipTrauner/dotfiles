#!/bin/bash

set -e
shopt -s dotglob

. utils.sh

# Install Developer tools
until ! xcode-select --install 2> /dev/null ; do
	sleep 2
done

# Install brew
if [ ! -x "$(command -v brew)" ]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install bash git git-lfs || echo -n ""

# git lfs is "special"
git lfs install

git checkout || echo "Checkout failed, continuing anyway..."

move_to_home
