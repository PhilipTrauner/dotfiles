#!/bin/bash

set -e
set -x

./dump/debian/dump-installed-packages.py
./dump/debian/dump-scripts.sh
./dump/debian/dump-user-config.sh
./dump/debian/dump-dotfiles.sh