#!/bin/bash

# Load configuration that would be loaded by any display manager.
source "$HOME/.xprofile"

# Start bspwm, my window manager.
exec bspwm
