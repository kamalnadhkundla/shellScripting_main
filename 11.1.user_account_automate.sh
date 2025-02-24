#!/bin/bash
set -x  

# Slack Webhook URL (Replace with your actual URL)
SLACK_WEBHOOK_URL="https://hooks.slack.com/services/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"

if [ $# -gt 0 ]; then
    USERNAME=$1

   
    EXISTING_USER=$(getent passwd "$USERNAME" | cut -d ':' -f1)

    if [ "$USERNAME" = "$EXISTING_USER" ]; then
        echo "$USERNAME already exists. Try a different username."
    else
        echo "Creating user: $USERNAME"

       
        useradd -m "$USERNAME" -s /bin/bash

      
        SPEC="$(echo '!@#$%^&*()_' | fold -w2 | shuf | head -1)"
        PASSWORD="India@${RANDOM}${SPEC}"

       
        echo "$USERNAME:$PASSWORD" | sudo chpasswd

      
        passwd -e "$USERNAME"

       
        SLACK_MESSAGE="{
            \"text\": \"🚀 *New User Created* 🚀\n👤 Username: *$USERNAME*\n🔑 Password: *$PASSWORD*\n📌 Please change your password upon first login.\"
        }"

      
        curl -X POST -H 'Content-type: application/json' --data "$SLACK_MESSAGE" "$SLACK_WEBHOOK_URL"

        echo "User $USERNAME created successfully, and details sent to Slack."
    fi
else
    echo "You have given $# arguments. Please provide at least one username."
fi