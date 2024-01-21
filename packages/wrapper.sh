#!/usr/bin/env bash

PACKAGE_NAME=$(basename ${SCRIPT_DIR})

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

    SYSTEM_PKGS="${SCRIPT_DIR}/${SUBDIR}/system.txt"
    if [ -f "${SYSTEM_PKGS}" ]; then 
        echo "${PM}" $(cat "${SYSTEM_PKGS}")
        eval "${PM}" $(cat "${SYSTEM_PKGS}")
    fi
    

}

for HINT in ${HINTS[@]}; do
    install_from_dir $HINT
done

