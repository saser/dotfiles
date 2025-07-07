#!/usr/bin/env zsh

alias s='snip'
alias sm='s -m'
alias sme='s -edit -m'
alias st='cat ~/.snip/$(date -I).txt'
alias ste='vim ~/.snip/$(date -I).txt'

# "snip inbox"
si () {
    s -m "$(printf "#inbox %s" "${1}")"
}

# "snip inbox edit"
sie () {
    s -edit -m "$(printf "#inbox %s" "${1}")"
}

# "snip inbox get"
sig () {
    cat ~/.snip/*.txt | grep -F '#inbox' | sort
}

# "snip inbox clear"
sic () {
    gsed -E -i 's/#inbox/#done/g' ~/.snip/*.txt
}
