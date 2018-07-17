#!/bin/bash

set -e

sudo mount -t cifs -o user=philip,domain=workgroup,uid=$(id -u philip),gid=$(id -g philip) //Abstergo.local/Infinite ~/Infinite
