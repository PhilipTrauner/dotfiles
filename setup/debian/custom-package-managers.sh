#!/bin/bash

set -e

export PATH="$HOME/.local/bin:$PATH"

pip3 install pipenv poetry --user

mkdir -p ~/.antigen/completions

poetry completions zsh > ~/.antigen/completions/_poetry

yarn global add i3-style
