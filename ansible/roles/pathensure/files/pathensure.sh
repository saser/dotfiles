#!/bin/sh

JOINPATH_FILE="${1}"
sort "$JOINPATH_FILE" | cut -d' ' -f 2 | paste -s -d ':' -
