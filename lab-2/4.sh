#!/bin/bash

for pid_dir in /proc/[0-9]*/;
do
    pid=$(basename $pid_dir)
    ppid=$(grep -s "PPid:" $pid_dir/status | awk '{print $2}')
    ser=$(grep -s "sum_exec_runtime" $pid_dir/sched | awk '{print $3}')
    nrs=$(grep -s "nr_switches" $pid_dir/sched | awk '{print $3}')

    art=$(echo "scale=2; $ser / $nrs" | bc)

    echo "ProcessID = $pid : Parent_ProcessID = $ppid : Average_Running_Time = $art" >> temp.log
done

sort -t= -nk3 temp.log > 4.log
rm temp.log