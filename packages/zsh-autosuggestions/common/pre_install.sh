#!/usr/bin/env bash

git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

cp "${PACKAGE_DIR}/common/add-autosuggestions.sh" "${HOME}/.oh-my-zsh/custom/hooks/pre-oh-my-zsh.d/"