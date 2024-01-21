#!/usr/bin/env bash

if command -v git &> /dev/null; then
    echo "git have installed already"
    exit 0
fi

echo "pacman -Sy --noconfirm"
sudo pacman -Sy --noconfirm

echo "pacman -S --noconfirm git"
sudo pacman -S --noconfirm git