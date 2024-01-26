#!/usr/bin/env bash

echo "$(cat ${BASE_DIR}/packages/${PACKAGE_NAME}/common/.zshrc_add)" >> "$HOME/.zshrc"

# Hooks for running before source $ZSH/oh-my-zsh.sh (Before init of oh-my-zsh)
# Use it to add plugins
mkdir -p "$HOME/.oh-my-zsh/custom/hooks/pre-oh-my-zsh.d"
# Hooks to run after oh-my-zsh initialized
#
mkdir -p "$HOME/.oh-my-zsh/custom/hooks/post-oh-my-zsh.d"