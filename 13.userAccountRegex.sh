#!/bin/bash
#,read -p "please enter username" username
set -x
#SLACK_WEB='https://hooks.slack.com/services/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'
if [ $# -gt 0 ]; then
   for  USERNAME in $@; do
        if [[ $USERNAME =~ ^[a-b][e-h][i-z][0-9][0-9][0-9]$ ]]; then
        #if [[ $USERNAME =~ ^[a-z]+$ ]]; then
        #if [[$USERNAME =~ ^[a-z]+ ]]; then
        #if [[ $USERNAME =~ ^[a-z][a-z][a-z][A-Z][A-Z][A-Z]$V]]; then
        #if [[ $USERNAME =~ ^[a-zA-Z] ]]; then
        #if [[ $USERNAME =~ ^[a-zA-Z]+$]]; then

            EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f1)

                if [ "${USERNAME}" = "${EXISTING_USER}" ]; then
                        echo "${USERNAME} already exist try a differnet username"
                 else
                        echo "lets create the user${USERNAME}"
                        useradd -m ${USERNAME} -s /bin/bash
                        SPEC1=$(echo '!@#$%^&*()_' | fold -1 | shuf | head -1);
                        SPEC2=$(echo '!@#$%^&*()_' | fold -1 | shuf | head -1);
                        PASSWORD="India@${SPEC1}${RANDOM}${SPEC2}"
                        echo "${USERNAME}:${PASSWORD}" | sudo chpasswd
                        passwd -e ${USERNAME}
                    # echo " the username is ${USERNAME} and password is ${PASSWORD}."
                    #curl -X POST ${SLACK_WEB} -sL -H 'content-type: application/json' --data "{"text" : \"Username is: ${USERNAME}\"}" >>/dev/null
                    #curl -X POST ${SLACK_WEB} -sL -H 'content-type: application/json' --data "{"text" : \"Temporary Password is: ${PASSWORD} Reset this password immediately.\"}" >>/dev/null
                    #curl -v -X POST 'https://hooks.slack.com/services/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' \
                    #-H 'Content-Type: application/json' \
                    #--data "$(jq -n --arg user "$USERNAME" --arg pass "$PASSWORD" \
                    #'{text: "New user has been created!\nUsername: \($user)\nTemporary Password: \($pass)\nPlease reset this password immediately."}')"
                fi
        else
            echo "the username ${USERNAME} DOES NOT MATCH THE REGEX EXPRESSION"
        fi
    done
else
    echo "please provide the username to create the user"
fi
