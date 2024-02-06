#!/usr/bin/env bash

DIR_TO_INSTALL="${PACKAGE_DIR}/common/config/"

find "${DIR_TO_INSTALL}" -type f | \
    xargs realpath --relative-to="${DIR_TO_INSTALL}" | \
    xargs -I {} install -D -m 600 "${DIR_TO_INSTALL}/{}" "${HOME}/.config/{}"