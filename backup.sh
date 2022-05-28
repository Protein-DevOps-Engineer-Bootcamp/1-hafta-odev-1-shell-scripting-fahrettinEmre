#!/bin/bash
######################
#Author : Fahrettin Emre Dalga
#Date : 26.05.2022
#Version:5.0.17
#Usage :
######################

#load config file
source /home/vagrant/devops/backup.conf  # conf dosyası getirildi

NOW=$(date +"%H:%M-%d-%m-%Y") # saat ve tarih ayarlandı
HOSTNAME=$(hostname -s)      # hostname 


ARCHIVE_FILE="${HOSTNAME}_${NOW}.tar.gz"  

tar -czf $DEST_DIR/$ARCHIVE_FILE $BACKUP_DIR   # sıkıştırma 

HASHDATE=$(hostname)_$(date +"%H:%M-%d-%m-%Y")    # hashdate değişkeni oluşturuldu.
DIRHASH=$(md5sum $DEST_DIR/$ARCHIVE_FILE)     # md5sum ile hash kodu alındı.
DIRHASHNAME="${HOSTNAME}_${NOW}.tar.gz.md5.txt"  # md5 doğrulama dosyası oluşturuldu.
echo $DIRHASH >> $LOG_DIR/${HASHDATE}.log     #değişken isimlerini conf dosyasından bulabilirsiniz.
echo $DIRHASH >> $DEST_DIR/${DIRHASHNAME}     

echo   # /mnt ve /tmp dizinlerine dosyalar gönderilmesi sağlandı.

echo "Backup finished."
