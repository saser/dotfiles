#!/usr/bin/zsh

source ${DOTS_HOME}/utils.zsh

PREFIX="neovim"

CONFIG_HOME="${HOME}/.config"
NEOVIM_HOME="${CONFIG_HOME}/nvim"

safely_unlink ${NEOVIM_HOME}/init.vim
