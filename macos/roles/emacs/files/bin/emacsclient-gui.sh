#!/bin/sh

osascript -e 'tell application "Emacs" to activate'
exec emacsclient -c "$@"
