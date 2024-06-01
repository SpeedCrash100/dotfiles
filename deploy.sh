#!/usr/bin/env bash

function run_prepare() {
    SCRIPT_DIR=$1


    if [ ! -d "${SCRIPT_DIR}" ]; then
        echo "Missing prepare directory"
        exit 1
    fi

    OS_PREPARE=$(basename "$SCRIPT_DIR")

    if [ -x "${SCRIPT_DIR}/prepare.sh" ]; then
        "${SCRIPT_DIR}/prepare.sh"
    else
        echo "No prepare script found for '${OS_PREPARE}'."
        exit 1
    fi


    if [ -r "${SCRIPT_DIR}/source" ]; then
        . "${SCRIPT_DIR}/source"
    else
        echo "No source found for '${OS_PREPARE}'."
        exit 1
    fi

    # Check if PM variable is set
    if [ -z "${PM}" ]; then 
        echo "Prepare does not set PM"
        exit 1
    fi

    # Now for PYTHON
    if [ -z "${PYTHON}" ]; then 
        echo "Prepare does not set PYTHON"
        exit 1
    fi

}

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export BASE_DIR=${SCRIPT_DIR}

OS=$(grep -E '^ID=' /etc/os-release | sed 's/ID=//g')
echo "Detected system: '${OS}'"

run_prepare "${BASE_DIR}/prepare/${OS}"