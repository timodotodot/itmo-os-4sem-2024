#!/bin/bash
touch full.log

grep "(WW)" /var/log/anaconda/X.log | sed "s/(WW)/Warning: /" > full.log
grep "(II)" /var/log/anaconda/X.log | sed "s/(II)Information: /" >> full.log

cat full.log