#!/bin/bash

file="$*"

echo $file
trash="/home/user/.trash"
logs="/home/user/.trash.log"

grep -F "$file" "$logs" | while read -r line;
do
	echo $line
	current=$(echo "$line" | awk '{$NF=""} 1')
	current=$(echo "$current" | sed 's/ *$//')
	trashFile=$(echo "$line" | awk '{print $NF }')

	echo -n "y/n?"

	read ans < /dev/tty

	if [[ "$ans" == "y" ]]
	then
		path=$(echo "$current" | grep -Eo '.*\/')

		if [ ! -d "$path" ]
		then
			fileName=$(basename "$current")
			path="/home/user/$fileName"
            echo "This directory was deleted. File will be restore in $path"
		else
			path="$current"
		fi
	
	trashFile="$trash/$trashFile"
	cp -rl "$trashFile" "$path"
	rm -r "$trashFile"

	fi
done