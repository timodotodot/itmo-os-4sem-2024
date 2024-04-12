#!/bin/bash

oper="+"
x=1
echo "Mode: $oper"
echo "x = $x"
tail -f pipe |

while true;
do
    read line

    case $line in 

        "+")
            oper="$line"
            echo "Mode: +"
        ;;

        "*")
            oper="$line"
            echo "Mode: *"
        ;;

        "QUIT")
            killall tail
            exit 0
        ;;

        [0-9])
            case $oper in
                "+")
                    old=$x
                    x=$(($x+$line))
                    echo "$old + $line = $x"
                ;;

                "*")
                    x=$(($x*$line))
                    echo $x
                ;;
            esac
        ;;

        *)
            killall tail
            exit 1
        ;;
    esac
done