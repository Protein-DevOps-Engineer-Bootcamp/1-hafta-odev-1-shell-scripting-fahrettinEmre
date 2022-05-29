#!/bin/bash
######################
#Author : Fahrettin Emre Dalga
#Date : 26.05.2022
#Version:5.0.17
#Usage : Backup
######################

#load config file
source /home/vagrant/devops/backup.conf  # conf dosyası getirildi.

# Saat ve tarih ayarlandı.
NOW=$(date +"%H:%M-%d-%m-%Y")
# hostname alındı.
HOSTNAME=$(hostname -s)
# Arşiv dosyası oluşturuldu.
ARCHIVE_FILE="${HOSTNAME}_${NOW}.tar.gz"  
# /mnt altına, home dizini altındaki userlar sıkıştırıldı.
tar -czf $DEST_DIR/$ARCHIVE_FILE $BACKUP_DIR  
# md5sum ile hash kodu oluşturuldu.
DIRHASH=$(md5sum $DEST_DIR/$ARCHIVE_FILE)
# md5 için doğrulama dosyası oluşturuldu.
DIRHASHNAME="${HOSTNAME}_${NOW}.tar.gz.md5.txt"  
#Log dosyası ismi verildi.
HASHDATE=$(hostname)_$(date +"%H:%M-%d-%m-%Y") 
#ilgili dizinlere gönderildi.
echo $DIRHASH >> $LOG_DIR/${HASHDATE}.log  
echo $DIRHASH >> $DEST_DIR/${DIRHASHNAME}     

echo   # /mnt ve /tmp dizinlerine dosyalar gönderilmesi sağlandı.

echo "Backup finished."
