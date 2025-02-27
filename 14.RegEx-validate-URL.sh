#!/bin/bash
DATA=$(cat applist.log)
#echo $DATA
for URL in $DATA; do
    if [[ "$URL" =~ ^https?://([^/]+) ]]; then
        domain=${BASH_REMATCH[1]}
        echo "$URL is a valid url and domian name is $domain."
    else
        echo "$url "Invalid URL as its not staring with https and http.
    fi
done
