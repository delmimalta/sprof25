[Interface]
Address = 10.20.30.3/29
PrivateKey = UEN3Lbpm+NyXsw+XMEZPKHAaMocFRP0KfDZvIiu+BUk=

# WebAdm
[Peer]
PublicKey = Pn1bzrpZoBob/VeAvWDQfazwrZh18WarKSKzid2K1wc=
AllowedIPs = 10.20.30.0/29
PersistentKeepalive = 10
Endpoint = ${floatingip_webadm}:51820
