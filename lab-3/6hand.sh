#!/bin/bash

echo $$ > .pid
oper="+"
x=1

usr1() {
    oper="+"
}

usr2() {
    oper="*"
}

term() {
    echo "Stopped"
    exit 0
}

trap "usr1" USR1
trap "usr2" USR2
trap "term" SIGTERM

while true;
do
    case $oper in
        "+")
            let x+=2
        ;;

        "*")
            let x*=2
        ;;
    esac
    echo $x
    sleep 1
done