# Load zplug, so we can use it for plugins.
source ${ZPLUG_HOME}/init.zsh

# List of zsh plugins, managed by zplug.

# Syntax for getting syntax highlighting in the terminal prompt.
# The `defer:2` part is taken from the README of zplug (https://github.com/zplug/zplug/blob/master/README.md)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Type a substring of some command, and get command history.
# The `defer:3` part is to make sure that it is loaded _after_
# `zsh-syntax-highlighting`, which is needed for it to work properly. See the
# README: https://github.com/zsh-users/zsh-history-substring-search
zplug "zsh-users/zsh-history-substring-search", defer:3

if ! zplug check --verbose; then
    echo -n "Install? [y/N] "
    if read -q; then
        zplug install
    fi
fi
zplug clean --force

zplug load

# Load all my keybindings.
source ${HOME}/.zsh-keybindings

# Load all my aliases.
source ${HOME}/.aliases

# Load my own custom prompt.
fpath=(${HOME}/.prompt ${fpath})
autoload -Uz promptinit
promptinit
prompt saser

# Set colortheme using base16-shell.
BASE16_COLORSCHEME=materia
source "${HOME}/.shellcolors/base16/scripts/base16-${BASE16_COLORSCHEME}.sh"
