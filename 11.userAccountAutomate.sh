#!/bin/bash
#,read -p "please enter username" username
set -x

if [ $# -gt 0 ]; then
    USERNAME=$1

    EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f1)

    if [ "${USERNAME}" = "${EXISTING_USER}" ]; then
        echo "${EXISTING_USER} already exist try a differnet username"
    else
        echo "lets create the user${USERNAME}"
    fi
else
    echo you have given $# arugument. okka argument evuu roo
fi
