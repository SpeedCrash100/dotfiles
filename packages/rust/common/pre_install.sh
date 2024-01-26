#!/usr/bin/env bash

if ! command -v rustup &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -y --default-toolchain stable --no-modify-path
fi

rustup default stable

cp "${PACKAGE_DIR}/common/rust.sh" "${HOME}/.local/etc/profile.d/"