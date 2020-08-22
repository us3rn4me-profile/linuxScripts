#!/usr/bin/env bash

sudo pacman -Sy --noconfirm mysql apache php-apache php-gd php-cgi php-pgsql
## Modules in apache

sudo sed -ie 's/^#LoadModule rewrite_module modules\/mod_rewrite.so/LoadModule rewrite_module modules\/mod_rewrite.so/' /etc/httpd/conf/httpd.conf
sudo sed -ie 's/^#LoadModule mpm_prefork_module modules\/mod_mpm_prefork.so/LoadModule mpm_prefork_module modules\/mod_mpm_prefork.so/' /etc/httpd/conf/httpd.conf
sudo sed -ie 's/^LoadModule mpm_event_module modules\/mod_mpm_event.so/#LoadModule mpm_event_module modules\/mod_mpm_event.so/' /etc/httpd/conf/httpd.conf
# Allow Override directories
sudo sed -ie 's/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf

## Modify config

# Allow vhosts
sed -ie 's/#Include conf\/extra\/httpd-vhosts.conf/Include conf\/extra\/httpd-vhosts.conf/' /etc/httpd/conf/httpd.conf
# PHP7
sudo echo -e "LoadModule php7_module modules/libphp7.so\nAddHandler php7-script php" >> /etc/httpd/conf/httpd.conf
# Wordpress
sudo echo -e "Include conf/extra/httpd-wordpress.conf" >> /etc/httpd/conf/httpd.conf
sudo echo -e 'Alias /wordpress "/usr/share/webapps/wordpress"                                           
<Directory "/usr/share/webapps/wordpress">                                                
AllowOverride All                                                                     
Options FollowSymLinks                                                                
Require all granted                                                                   
</Directory>' >> /etc/httpd/conf/extra/httpd-wordpress.conf
# PHP7 config
sudo echo -e "Include conf/extra/php7_module.conf" >> /etc/httpd/conf/httpd.conf


## Modify php.ini
sudo sed -ie 's/;extension=mysqli/extension=mysqli/' /etc/php/php.ini
sudo sed -ie 's/;extension=gd/extension=gd/' /etc/php/php.ini
sudo sed -ie 's/;extension=mysql/extension=mysql/' /etc/php/php.ini

# MariaDB
sudo mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
sudo systemctl start mysqld
