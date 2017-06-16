#!/usr/bin/env zsh

# Make sure we use vi-style keybindings.
bindkey -v

### Keybindings for external tools, such as plugins ###

# Define keybindings for history-substring-search.
bindkey -M viins '^P' history-substring-search-up
bindkey -M viins '^N' history-substring-search-down

# Load keybindings provided by the `fzf` package.
source /usr/share/fzf/key-bindings.zsh
