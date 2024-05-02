#!/bin/bash

home="/home/user"
last_backup_date=$(ls "$home" | grep -E "^Backup-" | sort -n | tail -1 | sed "s/Backup-//")
last_backup="$home/Backup-${last_backup_date}"
now_date=$(date +"%Y-%m-%d")
now_time=$(date -d "$now_date" +"%s")
last_backup_time=$(date -d "$last_backup_date" +"%s")
total_time=$(echo "(${now_time} - ${last_backup_time}) / 60 / 60 / 24" | bc)
repo="$home/.backup-report"

if [[ $total_time > 7 || -z "$last_backup_date" ]]; 
then
    mkdir "$home/Backup-$now_date"

    for object in "$home"/source/*; 
    do
        filename=$(basename "$object")
        if [[ -f "$object" ]]; 
        then
            cp "$object" "$home/Backup-$now_date"
        fi
    done

    list=$(ls "$home/source" | sed "s/^/\t/")
    echo -e "${now_date}. Created:\n${list}" >> "$repo"
else
    changes=""

    for object in "$home"/source/*; 
    do
        filename=$(basename "$object")

        if [[ -f "$last_backup/$filename" ]]; 
        then
            source_size=$(wc -c "$home/source/${filename}" | awk '{print $1}')
            backup_size=$(wc -c "${last_backup}/${filename}" | awk '{print $1}')
            total_size=$(echo "${source_size} - ${backup_size}" | bc)

            if [[ $total_size != 0 ]]; 
            then
                mv "$last_backup/$filename" "$last_backup/${filename}.${now_date}"
                cp "$object" "$last_backup"
                changes="${changes}\n\t$filename ($filename.${now_date})"
            fi
        else
            if [[ -f "$object" ]]; 
            then
                cp "$object" "$last_backup"
                changes="${changes}\n\t$filename"
            fi
        fi
    done

    if [[ ! -z "$changes" ]]; 
    then
        echo -e "${last_backup_date}. Update:\n${changes}" >> "$repo"
    fi
fi