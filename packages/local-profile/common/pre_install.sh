#!/usr/bin/env bash

mkdir -p "$HOME/.local/etc/profile.d"

cp "${BASE_DIR}/packages/${PACKAGE_NAME}/common/profile" "$HOME/.local/etc/"
cp "${BASE_DIR}/packages/${PACKAGE_NAME}/common/.bashrc" "$HOME/"