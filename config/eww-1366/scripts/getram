#!/bin/bash
LC_NUMERIC="en_US.UTF-8" printf "%.0f\n" $(free -m | grep Mem | awk '{print ($3/$2)*100}')
