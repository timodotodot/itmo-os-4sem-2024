#!/bin/bash

touch info.log
var=""
echo "" | tee info.log

while read line
do
if [[ "INFO" == $(echo $line | cut -d ' ' -f 2) ]]
then echo $line | tee -a info.log
fi
done < ../../../var/log/anaconda/syslog