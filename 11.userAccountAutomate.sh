#!/bin/bash
#,read -p "please enter username" username
USERNAME=$1

EXISTING_USER=$(cat /etc/passwd | grep -i -w ${USERNAME} | cut -d ':' -f1)
 echo EXISTING_USER