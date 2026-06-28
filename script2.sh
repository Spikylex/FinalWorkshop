#!/usr/bin/bash
REPORT="system_report.txt"

echo "####################################################" > "$REPORT"

echo "SYSTEM HEALTH REPORT - $(date)" >> "$REPORT"

echo "####################################################" >> "$REPORT"

echo -e "----Disk Health Status----" >> $REPORT

dmesg | grep -i "error" | tail -n 5 >> "$REPORT"
if [ $? -ne 0 ]; then
	echo "No disk errors found in kernel logs. Status: OK" >> "$REPORT"
fi

echo -e "----System Information----" >> "$REPORT"
echo "Uptime & Load Average: $(uptime)" >> "$REPORT"
echo -e "Memory Usage:" >> "$REPORT"
free -h >> "$REPORT"

echo -e "----Top 5 Memory Consuming Processes----" >> "$REPORT"
ps -eo pid,%cpu,%mem,comm --sort=-%mem | head -n 6 >> "$REPORT"

echo "Report generated successfully in $REPORT"
