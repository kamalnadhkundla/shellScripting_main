#!/bin/bash
pokemon_url='https://pokeapi.co/api/v2/pokemon?limit=100000'

pokemon_count = $(curl -sL https://pokeapi.co/api/v2/pokemon?limit=10 | jq ".count")

#pokemon_results = $(curl -sL https://pokeapi.co/api/v2/pokemon?limit=10 | jq ".results[].name"| tr -d '"')

rm -rf pokemon_count

curl -sL https://pokeapi.co/api/v2/pokemon?limit=10000 | jq ".results[].name" >>pokemon_count

if [ $pokemon_count -eq $(cat pokemon_count | WC -l) ]; then
    echo "total pokemon count is ${pokemon_count}.."
else
    echo "incorrect pokemon count"
fi
