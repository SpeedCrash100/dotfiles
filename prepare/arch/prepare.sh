#!/usr/bin/env bash

# Set the directory containing the scripts
ADDITIONAL_SCRIPT_DIR="${BASE_DIR}/prepare/arch/prepare.sh.d"

set -e

# Check if directory exists
if [ -d "$ADDITIONAL_SCRIPT_DIR" ]; then
    # Loop through all files in the directory
    for file in "$ADDITIONAL_SCRIPT_DIR"/*; do
        if [[ -f $file ]]; then
            bash "$file"
        fi
    done
else
    echo "Directory $ADDITIONAL_SCRIPT_DIR does not exist."
    exit -1
fi

set +e