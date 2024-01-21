#!/usr/bin/env bash

if command -v python3 &> /dev/null; then
    echo "python3 have installed already"
    echo "$(which python3)" > "/tmp/PYTHON"
    exit 0
fi

echo "pacman -S --noconfirm python"
sudo pacman -S --noconfirm python

PYTHON=$(which python3)

echo "${PYTHON}" > "/tmp/PYTHON"