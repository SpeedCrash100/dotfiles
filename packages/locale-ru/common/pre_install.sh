#!/usr/bin/env bash

# Generate locales
if ! command -v "locale-gen" &> /dev/null
then
    echo "locale-gen could not be found. Aborting"
    exit 1
fi


echo "en_US.UTF-8 UTF-8" | sudo tee /etc/locale.gen
echo "ru_RU.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen

sudo locale-gen

# Set keymaps and use win+space to switch binds
echo "KEYMAP=us"                        | sudo tee    "/etc/vconsole.conf"
echo "KEYMAP_TOGGLE=ru"                 | sudo tee -a "/etc/vconsole.conf"
echo "XKBLAYOUT=us,ru"                  | sudo tee -a "/etc/vconsole.conf"
echo "XKBOPTIONS=grp:win_space_toggle"  | sudo tee -a "/etc/vconsole.conf"

# Set locale for current user
mkdir -p "$HOME/.config/"
echo "LANG=ru_RU.UTF-8" | tee "$HOME/.config/locale.conf"

# For all other users Use en_us locale with russian formats
echo "LANG=en_US.UTF-8"     | sudo tee "/etc/locale.conf"
echo "LC_ALL=ru_RU.UTF-8"   | sudo tee -a "/etc/locale.conf"
