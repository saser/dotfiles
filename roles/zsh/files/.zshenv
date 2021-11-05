#!/usr/bin/env zsh

export ZSHENVFILES="${HOME}/.zsh-envfiles"

for f in "${ZSHENVFILES}"/*.zsh; do
    echo source "${f}"
    source "${f}"
done
