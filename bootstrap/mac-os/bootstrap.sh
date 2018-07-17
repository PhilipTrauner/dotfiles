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

brew install git git-lfs

# git lfs is "special"
git lfs install

git lfs checkout || echo "Checkout failed, continuing anyway..."

mkdir -p ~/Developer/setup
mv ./* ~/Developer/setup