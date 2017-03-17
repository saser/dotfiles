#!/usr/bin/zsh

source ${DOTS_HOME}/utils.zsh

PREFIX="tmux"

safely_link ${DOTS_HOME}/tmux/tmux.conf ${HOME}/.tmux.conf
