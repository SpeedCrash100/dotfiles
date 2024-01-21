#!/usr/bin/env bash

function get_unsorted() {
    for HINT in $@; do
        FILE="${BASE_DIR}/profiles/${HINT}.txt"
        if [ ! -f "${FILE}" ]; then 
            echo "ERROR: Cannot find file ${FILE} with packages" 1>&2;
            exit 1
        fi

        echo $(cat "${FILE}") 
    done
}


UNSORTED_PKGS=$(get_unsorted $@)
RESOLVED_PKGS=$( echo "${UNSORTED_PKGS}" | $PYTHON ${BASE_DIR}/profiles/resolve.py $@)
echo "${RESOLVED_PKGS}"

