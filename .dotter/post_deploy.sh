#!/usr/bin/env bash

function get_packages_to_install() {    

    {{#each dotter.packages}}
        {{#if this}}
            echo "{{@key}}"
        {{/if}}
    {{/each }}

}

function run_post_deploy_from_dir() {
    DIR=$1

    if [ ! -d "$DIR" ]; then
        return 0;
    fi

    if [ -r "${DIR}/post_deploy.generated.sh" ]; then 
        bash "${DIR}/post_deploy.generated.sh"
    elif [ -r "${DIR}/post_deploy.sh" ]; then
        bash "${DIR}/post_deploy.sh"
    else 
        echo "--> No post deploy script found in ${DIR}/post_deploy.generated.sh or ${DIR}/post_deploy.sh"
    fi
} 

function post_deploy_package() {
    PACKAGE_NAME=$1
    export OS=$2

    export PACKAGE_DIR="$PWD/packages/${PACKAGE_NAME}"

    if [ ! -d "${PACKAGE_DIR}" ]; then 
        return 0;
    fi

    echo "${PACKAGE_NAME}"


    if [ -d "${PACKAGE_DIR}/${OS}" ]; then 
        run_post_deploy_from_dir "${PACKAGE_DIR}/${OS}"
    elif [ -d "${PACKAGE_DIR}/common" ]; then 
        run_post_deploy_from_dir "${PACKAGE_DIR}/common"
    else 
        echo "--> No folders found for ${PACKAGE_NAME} for ${OS} to do post_install. Skipping"
    fi

    echo ""
} 

echo "============================================"
echo "        Post deploy script                  "
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
    post_deploy_package $pkg $OS
done


echo "============================================"