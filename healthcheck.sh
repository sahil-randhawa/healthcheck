#!/bin/bash

# Basic System Health Check Script

# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}************************************${NC}"
echo -e "${GREEN}          System Health Status      ${NC}"
echo -e "${BLUE}************************************${NC}"

# Print Operating System Details
echo -e "${YELLOW}Hostname:${NC} $(hostname)"
echo -n -e "${YELLOW}Operating System:${NC} "
if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$NAME $VERSION"
else
    echo "Not available"
fi
echo -e "${YELLOW}Kernel Version:${NC} $(uname -r)"
echo -e "${YELLOW}OS Architecture:${NC} $(uname -m)"

# Print system uptime
echo -n -e "${YELLOW}System Uptime:${NC} "
uptime -p

# Print current system date and time
echo -e "${YELLOW}Current System Date & Time:${NC} $(date)"

# Check for currently mounted file systems
echo -e "\n${YELLOW}Mounted File Systems:${NC}"
mount | grep -E "ext4|ext3|xfs|btrfs" | column -t

# Check disk usage on all mounted file systems
echo -e "\n${YELLOW}Disk Usage on Mounted File Systems:${NC}"
df -h | grep -E "Filesystem|ext4|ext3|xfs|btrfs" | column -t

# Check for CPU usage
echo -e "\n${YELLOW}CPU Usage:${NC}"
mpstat | tail -2

# Check for memory usage
echo -e "\n${YELLOW}Memory Usage:${NC}"
free -h

# Print top 5 memory consuming processes
echo -e "\n${YELLOW}Top 5 Memory Consuming Processes:${NC}"
ps -eo pmem,pid,ppid,user,stat,args --sort=-pmem | head -6

# Print top 5 CPU consuming processes
echo -e "\n${YELLOW}Top 5 CPU Consuming Processes:${NC}"
ps -eo pcpu,pid,ppid,user,stat,args --sort=-pcpu | head -6

echo -e "\n${BLUE}************************************${NC}"
echo -e "${GREEN}          Health Check Complete      ${NC}"
echo -e "${BLUE}************************************${NC}"
