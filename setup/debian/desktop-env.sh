#!/bin/bash

set -e

export PATH="$HOME/.yarn/bin:$PATH"

# Set i3 style
i3-style flat-gray -o ~/.config/i3/config --reload


# Set gtk theme
gtk-theme-switch2 /usr/share/themes/Numix
