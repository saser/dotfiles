#!/usr/bin/zsh
set -e
set -u
set -o pipefail

STOW_TARGET="${HOME}"

INSTALL_EXPORTS="${HOME}/dotfiles/install_exports.zsh"
if [[ ! -e "${INSTALL_EXPORTS}" ]]; then
    echo "Required file \`install_exports.zsh\` was not found at its expected location \`${HOME}/dotfiles/install_exports.zsh\`."
    echo "Aborting."
    exit 1
fi

source ${INSTALL_EXPORTS}
source ${DOTS_HOME}/utils.zsh

PREFIX="All"

# Uninstall shell configuration.
stow --target ${STOW_TARGET} --delete shell
ok "Uninstalled shell configuration."

# Uninstall tmux configuration.
${DOTS_HOME}/tmux/uninstall.zsh
ok "Uninstalled tmux configuration."

# Uninstall neovim configuration.
# NOTE: does _not_ uninstall the plugins.
stow --target ${STOW_TARGET} --delete neovim
ok "Uninstalled neovim configuration."
