# TODO: install coreutils and use `gls` instead of `ls` here. This makes macOS
# and Linux experiences similar.
if [[ "$(uname -s)" = "Darwin" ]]; then
    alias ls='ls -lahFG'
else
    alias ls='ls -l --all --human-readable --classify --group-directories-first --color=auto'
fi

alias ..='cd ..'
