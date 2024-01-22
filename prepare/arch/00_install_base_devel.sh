#!/usr/bin/env bash

echo "pacman -Sy --noconfirm"
sudo pacman -Sy --noconfirm

echo "pacman -S --noconfirm --needed base-devel curl which"
sudo pacman -S --noconfirm --needed base-devel curl which