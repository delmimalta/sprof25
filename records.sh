#!/bin/bash

samba-tool dns add 127.0.0.1 au-team.irpo r-dt A 192.168.33.50
samba-tool dns add 127.0.0.1 au-team.irpo fw-dt A 192.168.33.49
samba-tool dns add 127.0.0.1 au-team.irpo fw-dt A 192.168.33.30
samba-tool dns add 127.0.0.1 au-team.irpo fw-dt A 192.168.33.38
samba-tool dns add 127.0.0.1 au-team.irpo fw-dt A 192.168.33.46
samba-tool dns add 127.0.0.1 au-team.irpo admin-dt A 192.168.33.41
samba-tool dns add 127.0.0.1 au-team.irpo srv1-dt A 192.168.33.33
samba-tool dns add 127.0.0.1 au-team.irpo srv2-dt A 192.168.33.34
samba-tool dns add 127.0.0.1 au-team.irpo srv3-dt A 192.168.33.35
samba-tool dns add 127.0.0.1 au-team.irpo cli-dt A 192.168.33.1

samba-tool dns add 127.0.0.1 au-team.irpo r-hq A 192.168.11.30
samba-tool dns add 127.0.0.1 au-team.irpo r-hq A 192.168.11.38
samba-tool dns add 127.0.0.1 au-team.irpo r-hq A 192.168.11.46
samba-tool dns add 127.0.0.1 au-team.irpo sw1-hq A 192.168.11.42
samba-tool dns add 127.0.0.1 au-team.irpo sw2-hq A 192.168.11.43
samba-tool dns add 127.0.0.1 au-team.irpo sw3-hq A 192.168.11.44
samba-tool dns add 127.0.0.1 au-team.irpo admin-hq A 192.168.11.41
samba-tool dns add 127.0.0.1 au-team.irpo cli-hq A 192.168.11.1
samba-tool dns add 127.0.0.1 au-team.irpo srv1-hq A 192.168.11.33

echo ""
echo "DONE - A RECORDS"
echo ""

samba-tool dns zonecreate 127.0.0.1 11.168.192.in-addr.arpa
samba-tool dns zonecreate 127.0.0.1 33.168.192.in-addr.arpa

samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 50 PTR r-dt.au-team.irpo
samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 49 PTR fw-dt.au-team.irpo
samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 30 PTR fw-dt.au-team.irpo
samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 38 PTR fw-dt.au-team.irpo
samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 46 PTR fw-dt.au-team.irpo
samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 41 PTR admin-dt.au-team.irpo
samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 33 PTR srv1-dt.au-team.irpo
samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 34 PTR srv2-dt.au-team.irpo
samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 35 PTR srv3-dt.au-team.irpo
samba-tool dns add 127.0.0.1 33.168.192.in-addr.arpa 1 PTR cli-dt.au-team.irpo

samba-tool dns add 127.0.0.1 11.168.192.in-addr.arpa 30 PTR r-hq.au-team.irpo
samba-tool dns add 127.0.0.1 11.168.192.in-addr.arpa 38 PTR r-hq.au-team.irpo
samba-tool dns add 127.0.0.1 11.168.192.in-addr.arpa 46 PTR r-hq.au-team.irpo
samba-tool dns add 127.0.0.1 11.168.192.in-addr.arpa 42 PTR sw1-hq.au-team.irpo
samba-tool dns add 127.0.0.1 11.168.192.in-addr.arpa 43 PTR sw2-hq.au-team.irpo
samba-tool dns add 127.0.0.1 11.168.192.in-addr.arpa 44 PTR sw3-hq.au-team.irpo
samba-tool dns add 127.0.0.1 11.168.192.in-addr.arpa 41 PTR admin-hq.au-team.irpo
samba-tool dns add 127.0.0.1 11.168.192.in-addr.arpa 1 PTR cli-hq.au-team.irpo
samba-tool dns add 127.0.0.1 11.168.192.in-addr.arpa 33 PTR srv1-hq.au-team.irpo

echo ""
echo "DONE - PTR RECORDS"
echo ""

samba-tool dns add 127.0.0.1 au-team.irpo www CNAME srv1-dt.au-team.irpo -U administrator
samba-tool dns add 127.0.0.1 au-team.irpo zabbix CNAME srv1-dt.au-team.irpo -U administrator

echo ""
echo "DONE - CNAME RECORDS"
echo ""
