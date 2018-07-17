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

ask_details() {
	while ! sudo -n true 2> /dev/null ; do
		read -s -p "Password: " sudo_password
		echo
		sudo --stdin --validate <<< "${sudo_password}" 2> /dev/null || echo -n ""
	done
}