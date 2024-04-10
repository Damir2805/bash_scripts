#!/bin/bash


#make dump
pg_dump -F c -f /var/lib/postgresql/backups/$(date +"%d-%m-%y".sql) kamotive


#check if the dump file exists and copy one to the defined directory 
# if the file exists

FILE=$(ls /var/lib/postgresql/backups/ | grep -i [0-9-].sql)

if test -f "/var/lib/postgresql/backups/$FILE"; then
   mv /var/lib/postgresql/backups/$FILE /var/lib/postgresql/test
   sed -i 1d /var/lib/postgresql/logs/logs
   echo "'backup created successfully' $(date '+%H-%M-%d-%m-%y')" >> /var/lib/postgresql/logs/logs
else
   sed -i 1d /var/lib/postgresql/logs/logs
   echo "'backup has been failed' $(date '+%H-%M-%d-%m-%y')" >> /var/lib/postgresql/logs/logs
fi


