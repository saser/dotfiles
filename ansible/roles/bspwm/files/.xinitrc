#!/bin/sh

# Run script to merge in any Xresources.
"${XRDB_SCRIPT}"

sxhkd &
exec bspwm
