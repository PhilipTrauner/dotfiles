#!/bin/bash

set -e

applications=( alacritty evolution i3 i3status rofi volti ) 
for application in "${applications[@]}"
do
	rm -r content/debian/dotfiles/.config/$application
	cp -r ~/.config/$application content/debian/dotfiles/.config
done