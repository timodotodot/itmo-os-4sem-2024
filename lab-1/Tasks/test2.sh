#!/bin/bash

result=""
var=""

exc="$1"

if [[ "$1" == ""]]
then exc="q"
fi

while [[ "$var" != "$exc" ]]; 
do
    result+="$var"
    read var
done

echo "$result"