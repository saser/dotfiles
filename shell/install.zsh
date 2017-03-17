#!/usr/bin/zsh

source ${DOTS_HOME}/utils.zsh

PREFIX="zsh + shell"

safely_link ${DOTS_HOME}/shell/zshenv ${HOME}/.zshenv
safely_link ${DOTS_HOME}/shell/zshrc ${HOME}/.zshrc
safely_link ${DOTS_HOME}/shell/zplug ${HOME}/.zplug
