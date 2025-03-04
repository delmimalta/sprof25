#!/bin/bash

apt-get update && apt-get install -y postgresql16-server zabbix-server-pgsql
/etc/init.d/postgresql initdb
systemctl enable --now postgresql
su - postgres -s /bin/sh -c 'createuser --no-superuser --no-createdb --no-createrole --encrypted --pwprompt zabbix'

echo ""
echo "Type Password - zabbixpwd"
echo ""

su - postgres -s /bin/sh -c 'createdb -O zabbix zabbix'
systemctl restart postgresql
su - postgres -s /bin/sh -c 'psql -U zabbix -f /usr/share/doc/zabbix-common-database-pgsql-*/schema.sql zabbix'
su - postgres -s /bin/sh -c 'psql -U zabbix -f /usr/share/doc/zabbix-common-database-pgsql-*/images.sql zabbix'
su - postgres -s /bin/sh -c 'psql -U zabbix -f /usr/share/doc/zabbix-common-database-pgsql-*/data.sql zabbix'
apt-get install -y apache2 apache2-mod_php8.2
systemctl enable --now httpd2
apt-get install -y php8.2 php8.2-{mbstring,sockets,gd,xmlreader,pgsql,ldap,openssl}

echo ""
echo "DONE - DO FURTHER then UNCOMMENT and COMMENT PREVIOUS"
echo ""

#systemctl enable --now zabbix_pgsql
#apt-get install zabbix-phpfrontend-{apache2,php8.2} -y
#ln -s /etc/httpd2/conf/addon.d/A.zabbix.conf /etc/httpd2/conf/extra-enabled
#chown apache2:apache2 /var/www/webapps/zabbix/ui/conf
#systemctl restrart httpd2

#echo ""
#echo "DONE - CAN DO FURTHER"
#echo ""
