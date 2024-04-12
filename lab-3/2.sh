#!/bin/bash

at now + 2 minutes -f bash 1.sh
tail -n 0 -f report.log