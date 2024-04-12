#!/bin/bash

bash 4temp.sh&pid0=$!
bash 4temp.sh&pid1=$!
bash 4temp.sh&pid2=$!

renice +10 -p $pid0

read -n 1

kill -15 $pid2