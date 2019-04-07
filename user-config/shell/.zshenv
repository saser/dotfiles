# Environment variables.

# Needed to make sure zplug works.
export ZPLUG_HOME="${HOME}/.zplug"

# I use neovim as my main editor.
export EDITOR=emacs

# Source environment variables whose values are secret and should not be stored
# in the git repository. An example file can be found at the path of the file
# below, but with the suffix `.example`.
source "${HOME}/.zsh-extras/secrets.zsh"
