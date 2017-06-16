#!/bin/sh
set -e
set -u
set -o pipefail

# Some of my stuff is installed to folders that I do not want to ever by
# symlinks, such as `~/.config` and `~/.ssh`. Therefore, this script makes sure
# they exist and are "real" folders before installing anything into them.

DIRS_TO_CREATE=()
DIRS_TO_CREATE+=("${HOME}/.ssh")

XDG_CONFIG_HOME="${HOME}/.config"
DIRS_TO_CREATE+=("${XDG_CONFIG_HOME}")
for dir in ${DIRS_TO_CREATE[@]}; do
    if [ -e "${dir}" ]; then
        if [ ! -d "${dir}" ]; then
            echo "\`${dir}\` exists but is not a directory -- this seems wrong!"
            echo "Not installing."
            exit 1
        fi
        # Otherwise, `${dir}` exists and is a directory -- we do not need to do
        # anything.
    fi
    # If we get to this point, we know that `${dir}` does not exist, so create
    # it.
    mkdir --parents "${dir}"
done

STOW_TARGET="${HOME}"

# Install shell configuration.
stow --target "${STOW_TARGET}" shell

# Install ssh configuration.
stow --target "${STOW_TARGET}" ssh
# Enable services.
for service in ssh/.config/systemd/user/*.service; do
    systemctl --user enable $(basename ${service})
done

# Install git configuration.
stow --target "${STOW_TARGET}" git

# Install tmux configuration.
stow --target "${STOW_TARGET}" tmux

# Install neovim configuration.
stow --target "${STOW_TARGET}" neovim

# Install X-related things, such as `.xinitrc`.
stow --target "${STOW_TARGET}" xorg

# Install the wallpaper script.
# NOTE: does not actually download the wallpapers. To do that, run the Ruby
# script `download-images.rb` located in the `wallpapers/.wallpapers` directory.
stow --target "${STOW_TARGET}" wallpapers

# Install bspwm configuration.
stow --target "${STOW_TARGET}" bspwm

# Install sxhkd configuration.
stow --target "${STOW_TARGET}" sxhkd

# Install urxvt configuration.
stow --target "${STOW_TARGET}" urxvt

# Install my scripts.
# They will be available in my PATH, see `./shell/.zprofile`.
stow --target "${STOW_TARGET}" scripts
