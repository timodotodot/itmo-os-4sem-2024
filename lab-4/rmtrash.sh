#!/bin/bash

file="$PWD/$*"

if [[ "$#" != 1 ]];
then
	echo "Error"
	exit 1
fi

if [[ ! -d "/home/user/.trash" ]]
then
	mkdir "/home/user/.trash"
	touch "/home/user/.trash.log"
fi

data=$(date +"%d-%m-%Y_%T")
cp -rl "$file" "/home/user/.trash/$data"
echo "$file" "$data" >> /home/user/.trash.log
rm -rf "$file"