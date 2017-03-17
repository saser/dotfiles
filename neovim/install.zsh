#!/usr/bin/zsh

source ${DOTS_HOME}/utils.zsh

PREFIX="neovim"

CONFIG_HOME="${HOME}/.config"
NEOVIM_HOME="${CONFIG_HOME}/nvim"

if [[ ! -d "${CONFIG_HOME}" ]]; then
    mkdir -p ${CONFIG_HOME}
    ok "Created folder \`${CONFIG_HOME}\`."
fi

if [[ ! -d "${NEOVIM_HOME}" ]]; then
    mkdir -p ${NEOVIM_HOME}
    ok "Created folder \`${NEOVIM_HOME}\`."
fi

safely_link ${DOTS_HOME}/neovim/init.vim ${NEOVIM_HOME}/init.vim
