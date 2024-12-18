#!/bin/bash

# Configuration
LOG_FILE="sys_monitor_$(date +%F).log"  # Log file name with date
CPU_THRESHOLD=80                        # CPU usage alert threshold (%)
MEM_THRESHOLD=80                        # Memory usage alert threshold (%)

# Function to log data
log_data() {
    echo "$1" >> "$LOG_FILE"
}

while true; do
    clear
    echo "===== System Monitoring Tool ====="
    DATE=$(date)
    echo "Date and Time: $DATE"
    echo "----------------------------------"

    # CPU Usage
    CPU_USAGE=$(mpstat 1 1 | awk '/Average/ {print 100 - $NF}')
    echo "CPU Usage: $CPU_USAGE%"
    if (( $(echo "$CPU_USAGE > $CPU_THRESHOLD" | bc -l) )); then
        echo "⚠️ High CPU Usage Detected: $CPU_USAGE% ⚠️" | tee -a "$LOG_FILE"
    fi

    echo "----------------------------------"

    # Memory Usage
    MEM_USAGE=$(free | awk '/Mem/ {printf "%.2f", $3/$2 * 100}')
    echo "Memory Usage: $MEM_USAGE%"
    if (( $(echo "$MEM_USAGE > $MEM_THRESHOLD" | bc -l) )); then
        echo "⚠️ High Memory Usage Detected: $MEM_USAGE% ⚠️" | tee -a "$LOG_FILE"
    fi

    echo "----------------------------------"

    # Disk Usage
    echo "Disk Usage:"
    df -h
    DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
    echo "----------------------------------"

    # Network Activity
    echo "Network Activity:"
    ifstat -t 1 1
    echo "----------------------------------"

    # Log system stats
    log_data "$DATE | CPU: $CPU_USAGE% | MEM: $MEM_USAGE% | DISK: $DISK_USAGE"

    # Wait for the next update
    sleep 5
done
