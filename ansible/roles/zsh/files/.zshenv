#!/usr/bin/env zsh

_PATH="$("$HOME/.pathensure/pathensure.sh" "$HOME/.pathensure/entries.txt")"
echo 'Setting $PATH to '"${_PATH}"
export PATH="${_PATH}"

for f in "${HOME}/.env.d/"*.sh; do
    echo source "${f}"
    source "${f}"
done
