#!/bin/sh
set -e
set -u
set -o pipefail

# Since some of my stuff is installed to `~/.config`, I want to make sure that
# directory exists before stowing -- if it does not, Stow _might_ create a
# symbolic link named `~/.config` pointing into this repository. This is bad,
# since some applications I use put their default configuration in `~/.config`
# and I do not want their configuration to show up in this repository.
# Coincidentally (not really), this path is the same as default value for
# XDG_CONFIG_HOME, hence why I use that as variable name here.
XDG_CONFIG_HOME="${HOME}/.config"
if [ -e "${XDG_CONFIG_HOME}" ]; then
    if [ ! -d "${XDG_CONFIG_HOME}" ]; then
        echo "\`${XDG_CONFIG_HOME}\` exists but is not a directory -- this seems wrong!"
	echo "Not installing."
	exit 1
    fi
    # Otherwise, `~/.config` exists and is a directory -- we do not need to do
    # anything.
fi
# If we get to this point, we know that `~/.config` does not exist, so create
# it.
mkdir -p "${XDG_CONFIG_HOME}"

STOW_TARGET="${HOME}"

# Install shell configuration.
stow --target "${STOW_TARGET}" shell

# Install tmux configuration.
stow --target "${STOW_TARGET}" tmux

# Install neovim configuration.
stow --target "${STOW_TARGET}" neovim

# Install X-related things, such as `.xinitrc`.
stow --target "${STOW_TARGET}" xorg

# Install sxhkd configuration.
stow --target "${STOW_TARGET}" sxhkd

# Install my scripts.
# They will be available in my PATH, see `./shell/.zprofile`.
stow --target "${STOW_TARGET}" scripts
