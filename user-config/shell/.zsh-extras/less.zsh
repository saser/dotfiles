# Most applications go for `less` when using a pager, but some applications use
# the PAGER environment variable.
export PAGER=less

# Configure `less`. The first line specifies the options I use, and the other
# lines enable colored output (https://wiki.archlinux.org/index.php/Color_output_in_console#man).
# Color codes, taken from terminfo(5):
# - 0 black
# - 1 red
# - 2 green
# - 3 yellow
# - 4 blue
# - 5 magenta
# - 6 cyan
# - 7 white
export LESS="--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --chop-long-lines --hilite-unread"
export LESS_TERMCAP_us=$(tput smul)
export LESS_TERMCAP_so=$(tput setaf 6; tput smso)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
