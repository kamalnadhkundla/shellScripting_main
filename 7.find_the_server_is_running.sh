#!/bin/bash
SERVICE_NAME=$#
service ${SERVICE_NAME} status >/dev/null
if [ $# -eq 0 ]; then
    echo  "provide at least one argument"
else
    if [ $? -eq 0 ]; then
        echo "${SERVICE_NAME} IS UP and running"
    else
        echo "${SERVICE_NAME} IS  not UP and running"
    fi
fi  