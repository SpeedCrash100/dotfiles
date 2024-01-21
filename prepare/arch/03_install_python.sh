#!/usr/bin/env bash


echo "pacman -S --noconfirm python"
sudo pacman -S --noconfirm python

PYTHON=$(which python)

echo "${PYTHON}" > "/tmp/PYTHON"