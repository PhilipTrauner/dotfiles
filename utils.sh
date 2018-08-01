#!/bin/bash

set -e

MAGENTA="\033[0;35m"
RED="\033[0;31m"
COLOR_OFF="\033[0m"

function emphasis {
	echo -e "${MAGENTA}${1}${COLOR_OFF}"
}

function error {
	>&2 echo -e "${RED}${1}${COLOR_OFF}"
}

function os_detect {
	echo -n "OS: "

	if [ -x "$(command -v sw_vers)" ]; then
		emphasis "macOS $(sw_vers -productVersion)"
		./"$1"
	elif [ -f /etc/os-release ]; then
		source /etc/os-release
		emphasis "$PRETTY_NAME"
		if [ "$ID" = "debian" ]; then
			./"$2"
		else
			os_supported=false
		fi
	else
		emphasis "?"
		os_supported=false
	fi

	if [ "$os_supported" = false ]; then
		error "Unsupported OS :("
	fi
}

move_to_home() {
	if [ "$PWD" == "$HOME/Developer/setup" ]; then
		emphasis "Already moved to home!"
	else
		mkdir -p ~/Developer/setup
		mv ./* ~/Developer/setup
		emphasis "Moved to '$HOME/Developer/setup'."
	fi
}

ask_details() {
	sudo -k # Invalidate sudo timestamp to force password input
	
	while ! sudo -n true 2> /dev/null ; do
		read -s -p "Password: " sudo_password
		echo
		sudo --stdin --validate <<< "${sudo_password}" 2> /dev/null || echo -n ""
	done
}

renew_sudo() { 
	sudo -S -v <<< "${sudo_password}" 2> /dev/null
}