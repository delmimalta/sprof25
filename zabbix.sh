#!/bin/bash

sudo apt-get update && apt-get install -y postgresql16-server zabbix-server-pgsql
sudo /etc/init.d/postgresql initdb
sudo systemctl enable --now postgresql
sudo su - postgres -s /bin/sh -c 'createuser --no-superuser --no-createdb --no-createrole --encrypted --pwprompt zabbix'
sudo echo "Type Password - zabbixpwd"


sudo su - postgres -s /bin/sh -c 'createdb -O zabbix zabbix'
sudo systemctl restart postgresql
sudo su - postgres -s /bin/sh -c 'psql -U zabbix -f /usr/share/doc/zabbix-common-database-pgsql-*/schema.sql zabbix'
sudo su - postgres -s /bin/sh -c 'psql -U zabbix -f /usr/share/doc/zabbix-common-database-pgsql-*/images.sql zabbix'
sudo su - postgres -s /bin/sh -c 'psql -U zabbix -f /usr/share/doc/zabbix-common-database-pgsql-*/data.sql zabbix'
sudo apt-get install -y apache2 apache2-mod_php8.2
sudo systemctl enable --now httpd2
sudo apt-get install -y php8.2 php8.2-{mbstring,sockets,gd,xmlreader,pgsql,ldap,openssl}
sudo echo "GET READY TO CHANGE"
sudo nano /etc/php/8.2/apache2-mod_php/php.ini
sudo systemctl restrart httpd2
sudo echo "GET READY TO CHANGE ONCE AGAIN"
sudo nano /etc/zabbix/zabbix_server.conf
sudo systemctl enable --now zabbix_pgsql
sudo apt-get install zabbix-phpfrontend-{apache2,php8.2} -y
sudo ln -s /etc/httpd2/conf/addon.d/A.zabbix.conf /etc/httpd2/conf/extra-enabled
sudo chown apache2:apache2 /var/www/webapps/zabbix/ui/conf
sudo systemctl restrart httpd2
sudo echo "DONE"
