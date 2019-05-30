# Load zplug, so we can use it for plugins.
source ${ZPLUG_HOME}/init.zsh

# List of zsh plugins, managed by zplug.

# Syntax for getting syntax highlighting in the terminal prompt.
# The `defer:2` part is taken from the README of zplug (https://github.com/zplug/zplug/blob/master/README.md)
zplug "zsh-users/zsh-syntax-highlighting", \
      defer:2, \
      at:650dd79d86f885f8802732e3748d8719e787d22f

# Type a substring of some command, and get command history.
# The `defer:3` part is to make sure that it is loaded _after_
# `zsh-syntax-highlighting`, which is needed for it to work properly. See the
# README: https://github.com/zsh-users/zsh-history-substring-search
zplug "zsh-users/zsh-history-substring-search", \
      defer:3, \
      at:0f80b8eb3368b46e5e573c1d91ae69eb095db3fb

if ! zplug check --verbose; then
    echo -n "Install? [y/N] "
    if read -q; then
        echo
        zplug install
    fi
fi
zplug clean --force

zplug load

# Source any extra configuration provided by other parts of my dotfiles.
for extra in ${HOME}/.zsh-extras/*.zsh; do
    source ${extra}
done
