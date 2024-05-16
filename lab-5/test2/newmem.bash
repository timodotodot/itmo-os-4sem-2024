#!/bin/bash

declare -a arr

while true
do
	arr+=(1,2,3,4,5,6,7,8,9,10)
	if [[ "${#arr[@]}" -gt "$1" ]]
	then
		echo "Done! $$"
		exit 0
	fi
done