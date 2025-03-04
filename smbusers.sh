#!/bin/bash

samba-tool group add group1
samba-tool group add group2
samba-tool group add group3

echo ""
echo "DONE - GROUPS"
echo ""

for i in {1..10}; do
  samba-tool user add user$i P@ssw0rd;
  samba-tool user setexpiry user$i --noexpiry;
  samba-tool group addmembers "group1" user$i;
done

for i in {11..20}; do
  samba-tool user add user$i P@ssw0rd;
  samba-tool user setexpiry user$i --noexpiry;
  samba-tool group addmembers "group2" user$i;
done

for i in {21..30}; do
  samba-tool user add user$i P@ssw0rd;
  samba-tool user setexpiry user$i --noexpiry;
  samba-tool group addmembers "group3" user$i;
done

echo ""
echo "DONE - USERS"
echo ""

samba-tool ou add 'OU=CLI'
samba-tool ou add 'OU=ADMIN'

echo ""
echo "DONE - OU"
echo ""
echo ""
echo "DONE - CAN DO FURTHER"
echo ""
