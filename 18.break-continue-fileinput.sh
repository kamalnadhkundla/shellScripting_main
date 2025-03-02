#!/bin/bash
for WEBSITE in $(cat websites); do
    timeout 3 netcat -zv $websites 443 >>/dev/null/ 2>&1
    if [ $? -eq 0 ]; then
        echo "then domain $WEBSITE ia up and running"
    else
        echo "then domain $WEBSITE ia up and running"
        break
    fi
done
