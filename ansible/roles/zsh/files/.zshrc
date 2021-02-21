#!/usr/bin/env zsh

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

# Load aliases.
for f in "${ZSHALIASES}"/*.zsh; do
    echo source "${f}"
    source "${f}"
done
