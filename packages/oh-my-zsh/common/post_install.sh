#!/usr/bin/env bash

echo "$(cat ${BASE_DIR}/packages/${PACKAGE_NAME}/common/.zshrc_add)" >> "$HOME/.zshrc"

