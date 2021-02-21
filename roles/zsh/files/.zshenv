#!/usr/bin/env zsh

for f in "${HOME}/.env.d/"*.sh; do
    echo source "${f}"
    source "${f}"
done
