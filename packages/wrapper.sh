#!/usr/bin/env bash

export PACKAGE_NAME=$(basename ${SCRIPT_DIR})
export PACKAGE_DIR="${BASE_DIR}/packages/${PACKAGE_NAME}"

HINTS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -d|--depends)
            DEPENDS=YES
            shift 1 
            ;;
        -*|--*)
            echo "Unknown option $1" 1>&2
            exit 1
            ;;
        *)
            HINTS+=("$1") 
            shift 1 
            ;;
    esac
done


if [[ "$DEPENDS" == "YES" ]]; then
    echo "${PACKAGE_DEPS}";
    exit 0;
fi

function install_from_dir() {
    SUBDIR=$1
    shift 1

    PREINSTALL_SCRIPT="${SCRIPT_DIR}/${SUBDIR}/pre_install.sh"
    if [ -f "${PREINSTALL_SCRIPT}" ]; then 
        "${PREINSTALL_SCRIPT}" ${HINTS[@]}
    fi

    SYSTEM_PKGS="${SCRIPT_DIR}/${SUBDIR}/system.txt"
    if [ -f "${SYSTEM_PKGS}" ]; then 
        echo "${PM}" $(cat "${SYSTEM_PKGS}")
        eval "${PM}" $(cat "${SYSTEM_PKGS}")
    fi
    
    POSTINSTALL_SCRIPT="${SCRIPT_DIR}/${SUBDIR}/post_install.sh"
    if [ -f "${POSTINSTALL_SCRIPT}" ]; then 
        "${POSTINSTALL_SCRIPT}" ${HINTS[@]}
    fi
}

for HINT in ${HINTS[@]}; do
    install_from_dir $HINT
done

export PACKAGE_NAME=