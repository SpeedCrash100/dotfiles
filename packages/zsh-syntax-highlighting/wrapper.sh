#!/usr/bin/env bash

# space separated list of deps
PACKAGE_DEPS="oh-my-zsh "

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/../wrapper.sh