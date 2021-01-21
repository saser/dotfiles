#!/usr/bin/env zsh

_PATH="$("$HOME/.pathensure/pathensure.sh" "$HOME/.pathensure/entries.txt")"
echo 'Setting $PATH to '"${_PATH}"
export PATH="${_PATH}"

echo 'Setting the following environment variables:'
cat "$HOME/.envensure/entries.sh"
source "$HOME/.envensure/entries.sh"

source "${ZPLUG_HOME}/init.zsh"

# Syntax highlighting for the shell.
zplug "${ZSHPLUGINS}/zsh-syntax-highlighting", \
      from:local, \
      defer:2

# Search shell command history by substring matching.
zplug "${ZSHPLUGINS}/zsh-history-substring-search", \
      from:local, \
      defer:3

# Load my own custom prompt.
fpath=(${HOME}/.prompt ${fpath})
autoload -Uz promptinit
promptinit
prompt saser

# Load plugins.
zplug load --verbose

# Use vi-style keybindings.
bindkey -v

# Define keybindings for zsh-history-substring-search.
bindkey -M viins '^P' history-substring-search-up
bindkey -M viins '^N' history-substring-search-down
