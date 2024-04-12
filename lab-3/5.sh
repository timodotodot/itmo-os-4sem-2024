#!/bin/bash

mkfifo pipe
bash 5hand.sh&bash 5gen.sh
rm pipe