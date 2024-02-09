#!/usr/bin/env bash

# KDE Plasma can overwrite or locales settings,
# we will remove plasma specific config if it is exists
PLASMA_SPECIFIC_CONFIG="$HOME/.config/plasma-localerc"
if [ -w "$PLASMA_SPECIFIC_CONFIG"]; then
    rm "$PLASMA_SPECIFIC_CONFIG"
fi