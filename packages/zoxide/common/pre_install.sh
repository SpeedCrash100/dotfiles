#!/usr/bin/env bash

#!
#! The pre-install scripts executes BEFORE installing system.txt packages
#!

cargo install zoxide --locked

install "${PACKAGE_DIR}/common/enable_zoxide.sh" \
"$HOME/.oh-my-zsh/custom/hooks/post-oh-my-zsh.d/enable_zoxide.sh"