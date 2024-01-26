#!/usr/bin/env bash

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${HOME}/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

cp "${PACKAGE_DIR}/common/add-syntax-highlighting.sh" "${HOME}/.oh-my-zsh/custom/hooks/pre-oh-my-zsh.d/"