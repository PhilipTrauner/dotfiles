#!/bin/bash

set -e

DEBIAN_DOTFILES=( xbindkeysrc xsessionrc ) 
SHARED_DOTFILES=( gitconfig nanorc zshrc hushlogin )

function dump_dotfiles {
	local -n dotfiles=$1

	for dotfile in "${dotfiles[@]}"
	do
		cp ~/.${dotfile} "$2"
	done
}

dump_dotfiles DEBIAN_DOTFILES content/debian/dotfiles
dump_dotfiles SHARED_DOTFILES content/shared/dotfiles