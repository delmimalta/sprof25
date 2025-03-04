#!/bin/bash

apt-get install task-samba-dc -y

for service in smb nmb krb5kdc slapd bind; do 
  systemctl disable $service; 
  systemctl stop $service; 
done

grep -q KRB5RCACHETYPE /etc/sysconfig/bind || echo 'KRB5RCACHETYPE="none"' >> /etc/sysconfig/bind
grep -q 'bind-dns' /etc/bind/named.conf || echo 'include "/var/lib/samba/bind-dns/named.conf";' >> /etc/bind/named.conf


echo "DONE - DO FURTHER then UNCOMMENT"


rm -f /etc/samba/smb.conf
rm -rf /var/lib/samba
rm -rf /var/cache/samba
mkdir -p /var/lib/samba/sysvol

samba-tool domain join au.team DC -Uadministrator --realm=au.team --dns-backend=BIND9_DLZ

systemctl enable --now samba
systemctl enable --now bind

samba-tool drs replicate srv1-dt.au.team srv1-hq.au.team dc=au,dc=team -Uadministrator
samba-tool drs replicate srv1-hq.au.team srv1-dt.au.team dc=au,dc=team -Uadministrator


echo "DONE - CAN DO FURTHER"
