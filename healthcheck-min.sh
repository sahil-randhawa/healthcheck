#!/bin/bash

# Basic System Health Check Script

echo "************************************"
echo "          System Health Status      "
echo "************************************"

# Print Operating System Details
echo "Hostname: $(hostname)"
echo -n "Operating System: "
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$NAME $VERSION"
else
    echo "Not available"
fi
echo "Kernel Version: $(uname -r)"
echo "OS Architecture: $(uname -m)"

# Print system uptime
echo -n "System Uptime: "
uptime -p

# Print current system date and time
echo "Current System Date & Time: $(date)"

# Check for currently mounted file systems
#echo -e "\nMounted File Systems:"
#mount | grep -E "ext4|ext3|xfs|btrfs" | column -t

# Check disk usage on all mounted file systems
#echo -e "\nDisk Usage on Mounted File Systems:"
#df -h | grep -E "Filesystem|ext4|ext3|xfs|btrfs" | column -t

# Check for CPU usage
echo -e "\nCPU Usage:"
mpstat | tail -2

# Check for memory usage
echo -e "\nMemory Usage:"
free -h

# Print top 5 memory consuming processes
#echo -e "\nTop 5 Memory Consuming Processes:"
#ps -eo pmem,pid,ppid,user,stat,args --sort=-pmem | head -6

# Print top 5 CPU consuming processes
#echo -e "\nTop 5 CPU Consuming Processes:"
#ps -eo pcpu,pid,ppid,user,stat,args --sort=-pcpu | head -6

echo -e "\n************************************"
echo "          Health Check Complete      "
echo "************************************"
