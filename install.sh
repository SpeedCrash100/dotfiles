#!/usr/bin/env bash

function os_supported() {
    #!
    #! Gets if os useable for this script
    #!

    test "$1" = "arch"
    return $?
}


OS=$(grep -E '^ID=' /etc/os-release | sed 's/ID=//g')
echo "Detected system: '${OS}'"

os_supported $OS
if [ $? -eq 0 ] ; then 
    echo "OS supported";
else
    echo "OS unsupported";
    exit 1;
fi



