#!/bin/sh
set -e
set -u
set -o pipefail

# Since some of my stuff is installed to `~/.config`, I want to make sure that
# directory exists before stowing -- if it does not, Stow _might_ create a
# symbolic link named `~/.config` pointing into this repository. This is bad,
# since some applications I use put their default configuration in `~/.config`
# and I do not want their configuration to show up in this repository.
if [ -e "${HOME}/.config" ]; then
    if [ ! -d "${HOME}/.config" ]; then
        echo "`${HOME}/.config` exists but is not a directory -- this seems wrong!"
	echo "Not installing."
	exit 1
    fi
    # Otherwise, `~/.config` exists and is a directory -- we do not need to do
    # anything.
fi
# If we get to this point, we know that `~/.config` does not exist, so create
# it.
mkdir -p ${HOME}/.config

STOW_TARGET="${HOME}"

# Install shell configuration.
stow --target ${STOW_TARGET} shell

# Install tmux configuration.
stow --target ${STOW_TARGET} tmux

# Install neovim configuration.
stow --target ${STOW_TARGET} neovim
