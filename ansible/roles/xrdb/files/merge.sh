#!/bin/sh

for f in "${XRDB_DIR}"/*.xresources; do
    echo xrdb -merge "${f}"
done
