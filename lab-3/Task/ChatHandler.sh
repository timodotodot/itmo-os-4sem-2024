#!/bin/bash

tail -f -n 0 pipe |
while true;
do
    read line
    case $line in
        "stop")
            killall tail
            exit 0
        ;;

        *)
            echo $line
        ;;
    esac
done