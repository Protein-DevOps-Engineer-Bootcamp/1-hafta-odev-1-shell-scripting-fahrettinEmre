#!/bin/bash
######################
#Author : Fahrettin Emre Dalga
#Date : 27.05.2022
#Version:5.0.17
#Usage : Send Mail
######################

#load config file
source /home/vagrant/devops/mail.conf   # conf dosyası getirildi.

# df -h --total | grep "/dev/sda1 : Diskin kapladığı yeri verir.
# awk '{print $5}' : Gelen çıktıda split edip 5. sutunu aldık.
# sed 's/[^0-9]*//g' : Gelen çıktıda ki int değerini almamızı sağladı.
usage=$(df -h --total | grep "/dev/sda1" | awk '{print $5}'| sed 's/[^0-9]*//g')

#disk kullanım oranı büyük eşit ise
if [ $usage -gt 90 ]
then
# mailtemplate.txt dosyasından bir tane kopyala.
cp $MY_DIR$MY_TEMPLATE_NAME $MY_DIR$DELETE_FILE_NAME
# disk oranınını kopyaladığımız txt dosyasına yaz.   
echo $usage >> $MY_DIR$DELETE_FILE_NAME
# ssmtp ile mail adresimize bu txt dosyasını gönderdik.
/usr/sbin/ssmtp $MY_MAIL < $MY_DIR$DELETE_FILE_NAME
# kopyaladığımız txt dosyasını sildik.  
rm -f $MY_DIR$DELETE_FILE_NAME   
fi    # burada amaç txt dosyasının üzerine sürekli kullanım oranı yazmasını engellemek. Böylece txt dosyasında sadece tek kullanım oranı yazmış oldu.Üst üste yazmasını engelledik.