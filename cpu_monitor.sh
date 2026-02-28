#!/bin/bash

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
RAM=$(free | grep Mem | awk '{print ($3/$2)*100}')

THRESHOLD=75

echo "CPU=$CPU% RAM=$RAM%"

if (( $(echo "$CPU > $THRESHOLD" | bc -l) )) || \
   (( $(echo "$RAM > $THRESHOLD" | bc -l) )); then
    echo "THRESHOLD EXCEEDED → MIGRATING TO GCP"
    ./migrate_to_gcp.sh
else
    echo "SYSTEM NORMAL"
fi