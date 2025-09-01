#!/usr/bin/env zsh

# Set this to any non-empty value to print a bit of debugging information when
# Zsh starts up, such as which files it's sourcing etc.
export ZSHDEBUG=''

export ZSHENVFILES="${HOME}/.zsh-envfiles"

for f in "${ZSHENVFILES}"/*.zsh; do
    if [ ! -z "${ZSHDEBUG}" ]; then
        echo source "${f}"
    fi
    source "${f}"
done
