#!/usr/bin/env zsh

if [[ "$(uname -s)" = "Darwin" ]]; then
    source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
else
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi
