#!/bin/bash

set -e

# Install Developer tools
until ! xcode-select --install 2> /dev/null ; do
	sleep 2
done

# Install brew
if [ ! -x "$(command -v brew)" ]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install more current bash version
brew install bash

brew install git git-lfs

# git lfs is "special"
git lfs install

git checkout || echo "Checkout failed, continuing anyway..."

move_to_home