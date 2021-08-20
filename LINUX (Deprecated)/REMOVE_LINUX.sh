#!/bin/sh

# bool function to test if the user is root or not (POSIX only)
is_user_root () { [ "$(id -u)" -eq 0 ]; }

if is_user_root; then
    echo 'You are the almighty root!'
    sudo make remove
    exit 0 # implicit, here it serves the purpose to be explicit for the reader
else
    echo 'You are just an ordinary user. This script must be run with sudo permissions.' >&2
    exit 1
fi