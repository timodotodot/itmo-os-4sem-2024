#!/bin/bash

declare -a arr
declare -a numbers=(1,2,3,4,5,6,7,8,9,10)

rm report2.log
while true
do
	arr+=(${numbers[@]})
	let counter++
	if [[ $counter == 100000 ]]
	then
		echo "${#arr[@]}" >> report2.log
		counter=0
	fi
done