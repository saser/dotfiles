# Environment variables.

# Needed to make sure zplug works.
export ZPLUG_HOME="${HOME}/.zplug"

# I use Emacs as my main editor.
export EDITOR=emacs

# Set the base16 theme I am currently using. This will be used throughout
# several parts of my configuration, such as for Xresources, my editor, and
# assorted applications that support theming.
#
# There are places where I cannot use this environment variable directly. As far
# as I know currently, they are:
#   * Alacritty: colorscheme specified directly in main configuration file.
export BASE16_THEME=monokai
export BASE16_256=true

# Source environment variables whose values are secret and should not be stored
# in the git repository. An example file can be found at the path of the file
# below, but with the suffix `.example`.
source "${HOME}/.zsh-extras/secrets.zsh"
