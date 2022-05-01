#!/bin/bash 
mkdir `date '+%Y%m%d'`
cd /
PGPASSWORD="hoge" pg_dump -h 'localhost' -p 5432 -U misskey -d mk1 -v > ./main-db.dump
mv main-db.dump `date '+%Y%m%d'`/main-db.dump
mkdir /`date '+%Y%m%d'`
cp -r /home/misskey/misskey/files `date '+%Y%m%d'`/files
zip /`date '+%Y%m%d'`.zip /`date '+%Y%m%d'`/*
mega-put /`date '+%Y%m%d'`.zip /
rm -r /`date '+%Y%m%d'` /`date '+%Y%m%d'`.zip
