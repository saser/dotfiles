#!/bin/sh
set -e
set -u
set -o pipefail

STOW_TARGET="${HOME}"

# Install shell configuration.
stow --target ${STOW_TARGET} shell

# Install tmux configuration.
stow --target ${STOW_TARGET} tmux

# Install neovim configuration.
stow --target ${STOW_TARGET} neovim
