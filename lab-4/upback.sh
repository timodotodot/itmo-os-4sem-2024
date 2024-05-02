#!/bin/bash

home="/home/user"

lastdate=$(ls "$home" | grep -E "^Backup-" | sort -m | tail -1 | sed 's/^Backup-//')
last="$home/Backup-${lastdate}"

if [[ -z "$lastdate" ]]; 
then
    echo "Not found"
    exit 1
fi

if [[ ! -d "$home/restore" ]]; 
then
    mkdir "$home/restore"
else
    rm -r "$home/restore"
    mkdir "$home/restore"
fi


ls "$last" | grep -Ev "\.[0-9]{4}-[0-9]{2}-[0-9]{2}$" | while IFS= read -r Fi; 
do
    cp "${last}/${Fi}" "$home/restore/${Fi}"
done