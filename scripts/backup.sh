#!/bin/bash
BACKUP_DIR=/home/ubuntu/backups
DATE=$(date +%F_%H-%M)
tar -czf $BACKUP_DIR/webapps_$DATE.tar.gz /var/lib/tomcat10/webapps
find $BACKUP_DIR -name "webapps_*.tar.gz" -mtime +7 -delete