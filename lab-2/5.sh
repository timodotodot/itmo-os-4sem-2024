#!/bin/bash

awk -F ':' '{
    split($2, arr, "=")
    if (prev != " " && prev != arr[2]) {
        print "Average_Running_Children_of_ParentID = " prev " is " sum / count
        sum = 0
        count = 0
    }
    
    split($3, arr2, "=")
    sum += arr2[2]
    count++
    prev = arr[2]
    print
}
END { print "Average_Running_Children_of_ParentID = " prev " is " sum / count }' 4.log > 5.log