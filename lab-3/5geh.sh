#!/bin/bash

while true;
do
    read line
    echo "$line" > pipe

    if [[ "$line" == "QUIT"]];
    then
        echo "Stopped"
        exit 0
    fi

    if [[ "$line" != "+" && "$line" != "*" && "$line" != [0-9] ]];
    then
        echo "Error: unknown command"
        exit 1
    fi
done