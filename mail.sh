#!/bin/bash
######################
#Author : Fahrettin Emre Dalga
#Date : 27.05.2022
#Version:5.0.17
#Usage : Send Mail
######################

#load config file
source /home/vagrant/devops/mail.conf   # conf dosyası getirildi


usage=$(df -h --total | grep "/dev/sda1" | awk '{print $5}'| sed 's/[^0-9]*//g')  #readme içerisinde komut anlatılmıştır.

if [ $usage -gt 90 ]    #disk kullanım oranı büyük eşit ise 
then
cp $MY_DIR$MY_TEMPLATE_NAME $MY_DIR$DELETE_FILE_NAME   # mailtemplate.txt dosyasından bir tane kopyaladık.
echo $usage >> $MY_DIR$DELETE_FILE_NAME      # disk oranınını kopyaladığımız txt dosyasına yazdırdık.
/usr/sbin/ssmtp $MY_MAIL < $MY_DIR$DELETE_FILE_NAME   # ssmtp ile mail adresimize bu txt dosyasını gönderdik.
rm -f $MY_DIR$DELETE_FILE_NAME   # kopyaladığımız txt dosyasını sildik.
fi    # burada amaç txt dosyasının üzerine sürekli kullanım oranı yazmasını engellemek. Böylece txt dosyasında sadece tek kullanım oranı yazmış oldu.