#!/usr/bin/env zsh

_LS_BINARY="ls"

if [[ "$(uname -s)" = "Darwin" ]]; then
    _LS_BINARY="gls"
fi

alias ls="${_LS_BINARY} -l --all --human-readable --classify --group-directories-first --color=auto"

alias ..='cd ..'
