# how can ı use SSMTP ?

1- apt-get install ssmtp -y

2- nano /etc/ssmtp/ssmtp.conf

    FromLineOverride=YES 

    root=postmaster

    mailhub=smtp.your-domain.com:587

    hostname=ubuntu2004

    AuthUser=hiteshjethva@your-domain.com

    AuthPass=your-password

    FromLineOverride=YES

    UseSTARTTLS=YES

# How can ı use CRONTAB ?

1- env EDITOR = vim crontab -e 

Açılan yerde [CrontabGURU](https://crontab.guru/) adresinden zamanlama için yardım alabilirsiniz.

![Görsel](https://community-openhab-org.s3.dualstack.eu-central-1.amazonaws.com/original/3X/8/b/8b6108b07574e14013031215d34b0e486d357f2d.png)

00***  yerine kendi config ayarımızı yaparız.



Backup ödevinde crontab için 23 05 * * * kullanılmıştır.

Alarm ödevinde crontab için * * * * * kullanılmıştır.

### Program çıktısı olarak example_ss klasörüne fotoğraf eklenmiştir.


