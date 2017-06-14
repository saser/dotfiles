#!/bin/sh
set -e
set -u
set -o pipefail

STOW_TARGET="${HOME}"

# Uninstall shell configuration.
stow --target "${STOW_TARGET}" --delete shell

# Uninstall git configuration.
stow --target "${STOW_TARGET}" --delete git

# Uninstall tmux configuration.
stow --target "${STOW_TARGET}" --delete tmux

# Uninstall neovim configuration.
stow --target "${STOW_TARGET}" --delete neovim

# Uninstall X-related things, such as `.xinitrc`.
stow --target "${STOW_TARGET}" --delete xorg

# Uninstall wallpapers.
# NOTE: does not actually remove the images from the disk. That has to be done
# manually.
stow --target "${STOW_TARGET}" --delete wallpapers

# Uninstall bspwm configuration.
stow --target "${STOW_TARGET}" --delete bspwm

# Uninstall sxhkd configuration.
stow --target "${STOW_TARGET}" --delete sxhkd

# Uninstall urxvt configuration.
stow --target "${STOW_TARGET}" --delete urxvt

# Uninstall my scripts.
stow --target "${STOW_TARGET}" --delete scripts
