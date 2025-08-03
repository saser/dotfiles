#!/usr/bin/env zsh

# The inspiration for the below is what `opam init` (or some similar command,
# can't remember) generated for me when it asked if I wanted shell integration.
# The generated code hardcoded the path to ${HOME} (e.g. "/home/saser") but I
# decided to make this as portable as I can.

###############################################################################

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r "${HOME}/.opam/opam-init/init.zsh" ]] || source "${HOME}/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
# END opam configuration
