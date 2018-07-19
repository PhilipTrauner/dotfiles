#!/bin/bash

set -e

./dump/debian/dump-installed-packages.sh
./dump/debian/dump-scripts.sh
./dump/debian/dump-user-config.sh
./dump/debian/dump-dotfiles.sh