#!/bin/bash
#server to server 10
for SERVER in Server1 Server2 .. Server10; do
    telnet $SERVER 80
done

nano server.txt "(conatins ips)"
#copy file to 100 servers

for SERVER in $(cat server.txt); do
    echo ${SERVER[@]}
done
