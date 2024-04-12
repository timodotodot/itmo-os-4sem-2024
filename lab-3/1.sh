#!/bin/bash

data=$(date '+%d-%m-%y_%H:%M:%S')
mkdir test && echo "catalog test was created successfully" >> report.log && touch test/$d.tmp
ping www.net_nikogo.ru || echo "$data: Not found or connect on website" >> report.log