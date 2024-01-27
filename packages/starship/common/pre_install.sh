#!/usr/bin/env bash

cargo install starship

install "${PACKAGE_DIR}/common/enable_starship.sh" \
"$HOME/.oh-my-zsh/custom/hooks/post-oh-my-zsh.d/enable_starship.sh"