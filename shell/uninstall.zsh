#!/usr/bin/zsh

source ${DOTS_HOME}/utils.zsh

PREFIX="Shell"

safely_unlink ${HOME}/.zshenv
safely_unlink ${HOME}/.zshrc
safely_unlink ${HOME}/.zplug
