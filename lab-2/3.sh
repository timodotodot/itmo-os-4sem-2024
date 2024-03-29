#!/bin/bash

ps -e --format="pid cmd" --sort lstart | tail -n 5 | head -1