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
if [ ! -z "${ZSHDEBUG}" ]; then
    zplug load --verbose
else
    zplug load
fi

# Use vi-style keybindings.
bindkey -v

# Define keybindings for zsh-history-substring-search.
bindkey -M viins '^P' history-substring-search-up
bindkey -M viins '^N' history-substring-search-down

#
# Settings for shell command history.
#

# Number of events to keep in internal history (current session).
HISTSIZE=1000000
# File in which to store history.
HISTFILE="${HOME}/.zhistory"
# The number of events to store in the HISTFILE.
SAVEHIST=1000000

# For each event, also record its starting time and executing time.
setopt EXTENDED_HISTORY
# Remove the oldest duplicate event when trimming the internal history.
setopt HIST_EXPIRE_DUPS_FIRST
# If the command to be entered into the history is a duplicate of the previous
# one, do not enter it. Also, if the command to be entered is a duplicate of any
# previous event---not only the previous one---remove the older event first.
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
# If a command begins with at least one leading space, do not enter it into the
# history.
setopt HIST_IGNORE_SPACE
# Removes older commands that are duplicates of newer ones, when writing out the
# history file.
setopt HIST_SAVE_NO_DUPS
# Do not execute a command directly on history expansion (i.e. `sudo !!`) does
# not directly execute `sudo <previous command>`, but rather enters it on the
# command line to be executed.
setopt HIST_VERIFY
# Write to the history file after each command, and also read the history file
# incrementally. Essentially, this allows to share history among different
# shells, which is something I've wanted to do for a while but have been too
# lazy to look up.
setopt SHARE_HISTORY

# Load aliases.
for f in "${ZSHALIASES}"/*.zsh; do
    if [ ! -z "${ZSHDEBUG}" ]; then
        echo source "${f}"
    fi
    source "${f}"
done

# Load extra scripts.
for f in "${ZSHEXTRAS}"/*.zsh; do
    if [ ! -z "${ZSHDEBUG}" ]; then
        echo source "${f}"
    fi
    source "${f}"
done

# The below is a hack to make $PATH modifications work as I want them to.
#
# On recent macOS versions, there's a binary called `path_helper` which does a
# lot of good stuff, but it does something annoying too: it reorders the
# entries in the $PATH variable so that system entries come first. This happens
# **after** .zshenv has been sourced. Because of that, and because I like to
# put $PATH modifications in my $ZSHENVFILES directory, this little snippet
# should ensure that my changes to $PATH takes precedence.
#
# Huge props to @Linerre on GitHub for this writeup, which explains everything
# in good detail and showed me the solution:
# https://gist.github.com/Linerre/f11ad4a6a934dcf01ee8415c9457e7b2
UNAME="$(uname -s)"
if [[ "${UNAME}" = "Darwin" ]]; then
    for f in "${ZSHENVFILES}"/*.zsh; do
        if [ ! -z "${ZSHDEBUG}" ]; then
            echo source "${f}"
        fi
        source "${f}"
    done
fi
