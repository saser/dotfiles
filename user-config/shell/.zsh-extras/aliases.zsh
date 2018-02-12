#!/usr/bin/env zsh

# Basic shell navigation aliases.
alias ..='cd ..'
alias ls='ls -l --all --human-readable --classify --group-directories-first --color=auto'

# `git` aliases.
alias g='git'
alias ga='g add'
alias gs='g s' # git status
alias gl='g l' # one-line log
alias gd='g d' # git diff
alias gdc='g dc' # git diff --cached
alias gc='g c' # git commit
alias gcm='g cm' # git commit -m
alias gco='g co' # git checkout
alias gcob='g cob' # git checkout -b
alias gane='g ane' # git commit --amend --no-edit
alias gf='g f' # git fetch

# `tmux` aliases.
alias t='tmux'
alias tn='t new -s'
alias ta='t attach'
alias tat='ta -t' # attach to session name
alias tl='t list-sessions'

# `docker` aliases.
alias docker-ip="docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"

# Convenient aliases for interacting with the clipboard.  Inspired by the OS X
# commands `pbcopy` and `pbpaste`.  These commands use stdin and stdout,
# respectively. Convenient for e.g. copying the contents of a file, using
# `pbcopy <file`, or e.g. pasting the current clipboard contents to a file using
# `pbpaste >file`.
#
# NOTE: in X there are actually three clipboards: PRIMARY, SECONDARY, and
# CLIPBOARD. The PRIMARY clipboard is the one that is operated using the middle
# mouse button. The CLIPBOARD clipboard is the one that is usually operated
# using Ctrl-C and Ctrl-V, and is the one used for these aliases. The SECONDARY
# clipboard is rarely used.  (Taken/rephrased from xsel(1).)
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# Miscellaneous, actually kind of useless, aliases.
alias bacchus='echo -n "\u2030" | pbcopy'
alias trademark='echo -n "\u2122" | pbcopy'
