#!/bin/bash

ps -U root --no-headers | wc -l > 1.log
ps -U root -o pid,command | sed -r "s/\s*([0-9]+)\s(.+)$/\1:\2/" >> 1.log
