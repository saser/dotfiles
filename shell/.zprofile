# Set up our PATH to include everything that should be directly accessible.
# This is set up here, since `/etc/zsh/zprofile` is sourced every time zsh is
# started as a login shell, and that script overrides PATH. Thus, we cannot set
# up the path in `~/.zshenv`, which would have made more sense.
source "${HOME}/.path"

# Make Java applications (such as IntelliJ) behave nicely.
export _JAVA_AWT_WM_NONREPARENTING=1
