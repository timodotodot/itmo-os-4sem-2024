#!/bin/bash
awk -F: '{printf $1, $3}' /etc/passwd | sort -n -k2