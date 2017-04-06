# Load zplug, so we can use it for plugins.
source ${ZPLUG_HOME}/init.zsh

# List of zsh plugins, managed by zplug.

# Syntax for getting syntax highlighting in the terminal prompt.
# The `defer:2` part is taken from the README of zplug (https://github.com/zplug/zplug/blob/master/README.md)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

if ! zplug check --verbose; then
    echo -n "Install? [y/N] "
    if read -q; then
        zplug install
    fi
fi
zplug clean --force

zplug load

# Load my own custom prompt.
fpath=(${HOME}/.prompt ${fpath})
autoload -Uz promptinit
promptinit
prompt saser
