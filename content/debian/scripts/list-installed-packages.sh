#!/bin/bash

REGEX="[^\s]*\s((\([^\(\)]*\)\s?){2,}|(\(\/var\/lib\/apt\/([^\)])*\)))"
EXCLUDED=["task-laptop"]

parse_dpkg_log() {
	{
		for FN in `ls -1 /var/log/dpkg.log*` ; do
			CMD="cat"
			[ ${FN##*.} == "gz" ] && CMD="zcat"
			$CMD $FN | egrep "[0-9] install" | awk '{print $4}' \
			| awk -F":" '{print $1}'
		done
	} | sort | uniq
}

installed=$(parse_dpkg_log)
manual=$(apt-mark showmanual | sort)

comm -12 <(echo "$installed") <(echo "$manual") | while read package
do
	# Only list packages that have a remote origin (no locally installed deb files)
	if apt-cache showpkg $package | sed -n "3 p" \
		| grep -Poz --quiet $REGEX; then
		if ! echo ${EXCLUDED[@]} | grep -q -w "$package"; then
			echo "$package"
		fi
	fi
done
