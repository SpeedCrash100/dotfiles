#!/usr/bin/env bash

function get_packages_to_install() {    

    {{#each dotter.packages}}
        {{#if this}}
            echo "{{@key}}"
        {{/if}}
    {{/each }}

}

function install_package() {
    PACKAGE_NAME=$1
    export OS=$2

    export PACKAGE_DIR="$PWD/packages/${PACKAGE_NAME}"

    if [ ! -d "${PACKAGE_DIR}" ]; then 
        return 0;
    fi

    echo "${PACKAGE_NAME}"


    if [ -r "${PACKAGE_DIR}/${OS}/install.sh" ]; then 
        bash "${PACKAGE_DIR}/${OS}/install.sh"
    elif [ -r "${PACKAGE_DIR}/common/install.sh" ]; then 
        bash "${PACKAGE_DIR}/common/install.sh"
    else 
        echo "--> No install.sh found for ${PACKAGE_NAME} for ${OS}. Skipping"
    fi

    echo ""
}

echo "============================================"
echo "        Pre deploy script                   "
echo "============================================"

OS=$(grep -E '^ID=' /etc/os-release | sed 's/ID=//g')

. $PWD/prepare/${OS}/source


export OS
export PM
export PYTHON
export CARGO

PACKAGES=$(get_packages_to_install)

# Loop through package list
for pkg in $PACKAGES; do 
    install_package $pkg $OS
done


echo "============================================"