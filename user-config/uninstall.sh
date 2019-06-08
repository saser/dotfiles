#!/bin/bash
set -e
set -u
set -o pipefail

STOW_TARGET="${HOME}"

# Uninstall shell configuration.
stow --target "${STOW_TARGET}" --delete shell

# Uninstall ssh configuration.
for service in ssh/.config/systemd/user/*.service; do
    systemctl --user disable "$(basename "${service}")"
done
stow --target "${STOW_TARGET}" --delete ssh

# Uninstall git configuration.
stow --target "${STOW_TARGET}" --delete git

# Uninstall tmux configuration.
stow --target "${STOW_TARGET}" --delete tmux

# Uninstall emacs configuration.
stow --target "${STOW_TARGET}" --delete emacs

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

# Uninstall polybar configuration.
stow --target "${STOW_TARGET}" --delete polybar

# Uninstall sxhkd configuration.
stow --target "${STOW_TARGET}" --delete sxhkd

# Uninstall alacritty configuration.
stow --target "${STOW_TARGET}" --delete alacritty
# Remove the compiled terminfo files.
rm -rf "${HOME}"/.terminfo/**/*

# Uninstall my scripts.
stow --target "${STOW_TARGET}" --delete scripts
