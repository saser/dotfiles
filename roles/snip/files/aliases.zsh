#!/usr/bin/env zsh

alias s='snip'
alias sm='snip -m'
alias sme='snip -edit -m'
alias st='cat ~/.snip/$(date -I).txt'
alias ste='vim ~/.snip/$(date -I).txt'

# "snip inbox"
si () {
    snip -m "$(printf "#inbox %s" "${1}")"
}

# "snip inbox edit"
sie () {
    snip -edit -m "$(printf "#inbox %s" "${1}")"
}

# "snip inbox get"
sig () {
    cat ~/.snip/*.txt | grep -F '#inbox' | sort
}
