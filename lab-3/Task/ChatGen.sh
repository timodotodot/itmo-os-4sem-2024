#!/bin/bash

temp=$1
bash ChatHandler.sh&
while true;
do
    read line

    if [[ "$line" == "stop" ]];
    then
        exit 0
    else
        echo "$temp:$line" >> pipe
    fi
done