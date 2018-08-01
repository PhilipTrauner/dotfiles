#!/bin/bash

set -e

dpkg -i $(eval echo "~$SUDO_USER")/Developer/debs/*.deb