#!/usr/bin/zsh
set -e
set -u
set -o pipefail

INSTALL_EXPORTS="${HOME}/dotfiles/install_exports.zsh"
if [[ ! -e "${INSTALL_EXPORTS}" ]]; then
    echo "Required file \`install_exports.zsh\` was not found at its expected location \`${HOME}/dotfiles/install_exports.zsh\`."
    echo "Aborting."
    exit 1
fi

source ${INSTALL_EXPORTS}
source ${DOTS_HOME}/utils.zsh

PREFIX="All"

# Install shell configuration.
${DOTS_HOME}/shell/install.zsh
ok "Installed shell configuration."

# Install tmux configuration.
${DOTS_HOME}/tmux/install.zsh
ok "Installed tmux configuration."
