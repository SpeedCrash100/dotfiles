#!/usr/bin/env bash

function os_supported() {
    #!
    #! Gets if os useable for this script
    #!

    test "$1" = "arch"
    return $?
}

function execute() {
    #!
    #! Execute script but check if it is executable first. If it is not, display
    #! warning to user
    #!

    FILE="${1}"
    shift 1

    if [[ ! -x "$FILE" ]]; then
        echo "WARNING: $FILE is not executable" 1>&2
        return 0
    fi

    eval "${FILE}" $@

}

function execute_scripts() {
    #!
    #! Runs all scripts in folder $1 using remaining elements as subfolder list
    #! Example: `execute_scripts prepare common arch` will run all scripts in
    #! folders prepare/common and prepare/arch in same order of appearence 
    #!

    set -e

    MAIN_FOLDER=${1}
    shift 1

    for SUBFOLDER in $@; do
        SEARCH_PATH="$MAIN_FOLDER/${SUBFOLDER}"

        if [[ ! -d ${SEARCH_PATH} ]]; then
            echo "$SEARCH_PATH not found, skipping" 1>&2;
            continue;
        fi

        SCRIPTS=$( find ${SEARCH_PATH} -type f 2>/dev/null | sort )

        for SCRIPT in $SCRIPTS; do
            echo "$SCRIPT";
            execute $SCRIPT;
        done

    done

    set +e

}


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
export BASE_DIR=${SCRIPT_DIR}


OS=$(grep -E '^ID=' /etc/os-release | sed 's/ID=//g')
echo "Detected system: '${OS}'"

os_supported $OS
if [ $? -eq 0 ] ; then 
    echo "OS supported";
else
    echo "OS unsupported" 1>&2;
    exit 1;
fi

# Hints is used to select corresponding script folder
HINTS=( $@ "$OS" "common")

# Prepare system
execute_scripts ${SCRIPT_DIR}/prepare ${HINTS[@]}

export PM=$(cat /tmp/PM 2>/dev/null)
echo "Package manager is ${PM}"
if [ -z "$PM" ]; then 
    echo "FAIL: PM is not set by prepare scripts" 1>&2;
    exit 2;
fi


export PYTHON=$(cat /tmp/PYTHON 2>/dev/null)
echo "Python 3 is ${PYTHON}"
if [ -z "$PYTHON" ]; then 
    echo "FAIL: PYTHON is not set by prepare scripts" 1>&2;
    exit 3;
fi

PACKAGES=$( ${SCRIPT_DIR}/profiles/packages.sh ${HINTS[@]} )
if [ $? -eq 0 ]; then 
    echo "Packages to install: $PACKAGES";
else
    echo "Failed to get packages" 1>&2;
    exit 4;
fi

for PKG in ${PACKAGES[@]}; do 
    PKG_PATH="${SCRIPT_DIR}/packages/${PKG}/wrapper.sh"
    eval "${PKG_PATH}" "${HINTS[@]}"
done

