#!/bin/bash
echo "Checks if there is free space"
AVAILABLE_MB=$(df --output=avail /home/ubuntu/backup | tail -n 1 | awk '{print int($1/1024)}')

if [ "$AVAILABLE_MB" -lt 100 ]; then
	echo "Error: Not enough disk space!"
	exit 1
fi

tar -czf /home/ubuntu/backup/etc_backup_$(date +%F).tar.gz /etc 2>/dev/null

echo "Backup complete"
