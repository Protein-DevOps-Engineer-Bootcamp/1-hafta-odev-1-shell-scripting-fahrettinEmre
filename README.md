AÇIKLAMALAR
Crontab Kullanımı için :

env EDITOR=vim crontab -e komutu ile belirtilen backup saati secilmiştir. Sistem 23.05 de backup alır. 05 23 * * * 
Mail içinde eğer disk kullanımı %90 ise her dakika kontrol edip mail atar. * * * * *

mail ödevi için:
usage = $(df -h --total | grep "/dev/sda1" | awk '{print $5}'| sed 's/[^0-9]*//g')

df -h --total : diskin kapladığı yer
grep "/dev/sda1 : disk 
awk '{print$5}' : df -h --total komutunu böldük ve
sed 's/[^0-9]*//g') : int değerini aldık, ve çıkan bu değeri
mailtemplate.txt ye yazdırdık.

md5sum ile hash kodu oluşturup ilişkilendirdik.





# 1.Hafta-Odev-1-shell-scripting


## 1.Odev: Yedekleme Odevi

Sistemdeki tum kullanicilarin home dizini yedekleyecek, yedek dosyasinin ismi kullanicinin ismi ve yedekleme tarihi ve saati olacak. Yedekleme dizini /mnt olacak; bu bir degiskene atanmali yine ayni dizinde yedekleme dosyasinin md5 dogrulama dosyasi olmali. Yedekleme her gun saat 23:05 gece otomatik yapilmali.
/tmp dizini altinda bu scriptin en son ne zaman calistigina dair bir log dosyasi olusturun.

```bash

Example:  
yedek adi: username_01011987_2201.tar.gz
md5_sum_dosya_adi: username_01011987_2201.tar.gz.md5.txt
son_calisma_saati: /tmp/yedekleme_scripti_son_calisma_saati.log

```

## 2.Odev: Alarm Odevi

Alarm Odevi: Bir script yazin :D bu script GNU/Linux sunucunuzun uzerinde dakika’da bir calissin ve makinadaki herhangi bir diskin yada partition'in kullanim orani %90’in uzerinde ise mail atsin. 


Mail Ornegi:

![Alt text](example_ss/disk_alert.png?raw=True "Disk Alert Example")







