# Добавляем правило в группу безопасности для ICMP


resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_icmp" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "icmp"
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_1.id
}

# Добавляем правило в группу безопасности для SSH


resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_ssh" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_2.id
}












# Создаём группу безопасность для WEB-трафика (HTTP/HTTPS)


resource "openstack_networking_secgroup_v2" "secgroup_3" {
  name = "WEB"
  description = "WEB for HTTP/HTTPS"
}

# Добавляем первое правило в группу безопасности для WEB (HTTP)


resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_http" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_3.id
}

# Добавляем второе правило в группу безопасности для WEB (HTTPS)


resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_https" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_3.id
}

# Создаём группу безопасность для VPN (WireGuard)


resource "openstack_networking_secgroup_v2" "secgroup_4" {
  name = "VPN"
  description = "VPN (Wireguard)"
}

# Добавляем правило в группу безопасности для VPN (WireGuard)


resource "openstack_networking_secgroup_rule_v2" "secgroup_rule_vpn" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "udp"
  port_range_min    = 51820
  port_range_max    = 51820
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = openstack_networking_secgroup_v2.secgroup_4.id
}
