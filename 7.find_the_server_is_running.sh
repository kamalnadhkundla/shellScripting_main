#!/bin/bash
SERVICE_NAME1=${@}
for SERVICE_NAME in ${SERVICE_NAME1}
do

if [ $# -eq 0 ] || [ $# -gt 1 ]; then
    echo  "provide at least one argument or not more than 1 argument"
else
    service ${SERVICE_NAME} status >/dev/null
    if [ $? -eq 0 ]; then
        echo "${SERVICE_NAME} IS UP and running"
    else
        echo "${SERVICE_NAME} IS  not UP and running"
    fi
fi  
done