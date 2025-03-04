#!/bin/bash

apt-get install task-samba-dc -y
control bind-chroot disabled
grep -q KRB5RCACHETYPE /etc/sysconfig/bind || echo 'KRB5RCACHETYPE="none"' >> /etc/sysconfig/bind
grep -q 'bind-dns' /etc/bind/named.conf || echo 'include "/var/lib/samba/bind-dns/named.conf";' >> /etc/bind/named.conf


echo "DONE - CAN DO FURTHER"
