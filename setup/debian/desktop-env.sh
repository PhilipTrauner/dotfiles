#!/bin/bash

set -e

export PATH="$HOME/.yarn/bin:$PATH"

# Set i3 style
i3-style flat-gray -o ~/.config/i3/config --reload

# Set desktop/lightdm background
sudo update-alternatives --install /usr/share/images/desktop-base/desktop-background desktop-background /usr/share/images/desktop-base/background.svg 100

# Set gtk theme
gtk-theme-switch2 /usr/share/themes/Numix
