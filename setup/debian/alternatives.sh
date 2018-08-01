#!/bin/bash

set -e

# Set desktop/lightdm background
update-alternatives --install /usr/share/images/desktop-base/desktop-background desktop-background /usr/share/images/desktop-base/background.svg 100
# Set grub background
update-alternatives --install /usr/share/images/desktop-base/desktop-grub.png desktop-grub /usr/share/images/desktop-base/background.png 100