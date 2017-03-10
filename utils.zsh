#!/usr/bin/zsh
set -e
set -u
set -o pipefail

function green {
    local color='\033[0;32m'
    local reset='\033[0m'
    echo -ne "${color}$@${reset}"
}

function bold_green {
    local color='\033[1;32m'
    local reset='\033[0m'
    echo -ne "${color}$@${reset}"
}

function yellow {
    local color='\033[0;33m'
    local reset='\033[0m'
    echo -ne "${color}$@${reset}"
}

function bold_yellow {
    local color='\033[1;33m'
    local reset='\033[0m'
    echo -ne "${color}$@${reset}"
}

function red {
    local color='\033[0;31m'
    local reset='\033[0m'
    echo -ne "${color}$@${reset}"
}

function bold_red {
    local color='\033[1;31m'
    local reset='\033[0m'
    echo -ne "${color}$@${reset}"
}

function warn {
    set +u
    if [[ -z "${PREFIX}" ]]; then
        PREFIX="warning"
    fi
    set -u
    echo -e "$(bold_yellow \[${PREFIX}\]) $(yellow $@)"
}

function err {
    set +u
    if [[ -z "${PREFIX}" ]]; then
        PREFIX="err"
    fi
    set -u
    echo -e "$(bold_red \[${PREFIX}\]) $(red $@)"
}

function ok {
    set +u
    if [[ -z "${PREFIX}" ]]; then
        PREFIX="ok"
    fi
    set -u
    echo -e "$(bold_green \[${PREFIX}\]) $(green $@)"
}

function hard_err {
    err "$@"
    exit 1
}

function safely_link {
    local file
    local linkname

    if [[ $# < 2 ]]; then
        hard_err "Usage: safely_link <file> <link-name>"
    fi

    file=$1
    linkname=$2

    if [[ -e ${linkname} ]]; then
        warn "A file at \`${linkname}\` already exists; not linking."
    else
        ln -sr ${file} ${linkname}
        ok "Created symbolic link from \`${linkname}\` to \`${file}\`."
    fi
}

function safely_unlink {
    local linkname

    if [[ $# < 1 ]]; then
        hard_err "Usage: safely_unlink <link-name>"
    fi

    linkname=$1

    if [[ -L ${linkname} ]]; then
        rm ${linkname}
	ok "Removed symbolic link at \`${linkname}\`."
    elif [[ -e ${linkname} ]]; then
        warn "A file at \`${linkname}\` exists, but it is not a symbolic link; not removing."
    else
        warn "No file exists at \`${linkname}\`; not attempting to remove."
    fi
}
