#!/bin/bash
SERVICE_NAME=$#
service ${SERVICE_NAME} status >/dev/null
if [ $# -eq 0 && $# -gt 2 ]; then
    echo  "provide at least one argument or not more than 1 argument"
else
    if [ $? -eq 0 ]; then
        echo "${SERVICE_NAME} IS UP and running"
    else
        echo "${SERVICE_NAME} IS  not UP and running"
    fi
fi  