_PATH="$("$HOME/.pathensure/pathensure.sh" "$HOME/.pathensure/entries.txt")"
echo 'Setting $PATH to '"${_PATH}"
export PATH="${_PATH}"

echo 'Setting the following environment variables:'
cat "$HOME/.envensure/entries.sh"
source "$HOME/.envensure/entries.sh"

source "${ZPLUG_HOME}/init.zsh"

# Syntax highlighting for the shell.
zplug "${ZSHPLUGINS}/zsh-syntax-highlighting", \
      from:local, \
      defer:2

# Load my own custom prompt.
fpath=(${HOME}/.prompt ${fpath})
autoload -Uz promptinit
promptinit
prompt saser

zplug load --verbose
