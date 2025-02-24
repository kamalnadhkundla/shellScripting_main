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
        useradd -m ${USERNAME} -s /bin/bash
        SPEC=$(echo '!@#$%^&*()_' | fold -1 | shuf | head -1);
        PASSWORD="India@${RANDOM}${SPEC}
        echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
        passwd -e ${USERNAME}
        echo " the username is ${USERNAME} and password is ${PASSWORD}."
    fi
else
    echo you have given $# arugument. okka argument evuu roo
fi
