# Обращаемся к источнику данных, чтобы узнать ID существующего виртуального маршрутизатора


data "openstack_networking_router_v2" "router" {
  name = "cloud"
}

# Создаём сеть с именем "INTERNET" в соответствие с топологией


resource "openstack_networking_network_v2" "network" {
  name           = "INTERNET"
  admin_state_up = "true"
}

# Создаём подсеть с именем "INTERNET" в ранее созданной сети с именем "INTERNET"


resource "openstack_networking_subnet_v2" "subnet" {
  name            = "INTERNET"
  network_id      = openstack_networking_network_v2.network.id
  cidr            = "192.168.200.0/24"
  ip_version      = 4
  gateway_ip      = "192.168.200.1"
  dns_nameservers = [ "77.88.8.8" ]
  enable_dhcp     = true

  allocation_pool {
    start = "192.168.200.100"
    end   = "192.168.200.200"
  }
}

# Добавляем в существующий маршрутизатор созданную подсеть с именем "INTERNET", чтобы в дальнейшем ВМ подключённые к данной подсети имели доступ в Интернет


resource "openstack_networking_router_interface_v2" "router_interface" {
    router_id = data.openstack_networking_router_v2.router.id
    subnet_id = openstack_networking_subnet_v2.subnet.id
}












# Создадим порт для инстанса WebADM


#resource "openstack_networking_port_v2" "port_webadm" {
#  name       = "webadm"
#  network_id = openstack_networking_network_v2.network.id

#  fixed_ip {
#    subnet_id = openstack_networking_subnet_v2.subnet.id
#    ip_address = "192.168.200.20"
#  }
#}

# Создадим порт для инстанса WEB1


#resource "openstack_networking_port_v2" "port_web1" {
#  name       = "web1"
#  network_id = openstack_networking_network_v2.network.id

#  fixed_ip {
#    subnet_id = openstack_networking_subnet_v2.subnet.id
#    ip_address = "192.168.200.21"
#  }
#}

# Создадим порт для инстанса WEB2


#resource "openstack_networking_port_v2" "port_web2" {
#  name       = "web2"
#  network_id = openstack_networking_network_v2.network.id

#  fixed_ip {
#    subnet_id = openstack_networking_subnet_v2.subnet.id
#   ip_address = "192.168.200.22"
#  }
#}

# Создадим порт для балансировщика нагрузки Load Balancer


#resource "openstack_networking_port_v2" "port_loadbalancer" {
#  name       = "Load Balancer"
#  network_id = openstack_networking_network_v2.network.id

#  fixed_ip {
#    subnet_id = openstack_networking_subnet_v2.subnet.id
#    ip_address = "192.168.200.23"
#  }
#}












# Создадим плавающий IP для инстанса WebADM


#resource "openstack_networking_floatingip_v2" "floatingip_webadm" {
#  pool = "public"
#}

# Создадим плавающий IP для инстанса WEB1


#resource "openstack_networking_floatingip_v2" "floatingip_web1" {
#  pool = "public"
#}

# Создадим плавающий IP для инстанса WEB2


#resource "openstack_networking_floatingip_v2" "floatingip_web2" {
#  pool = "public"
#}

# Создадим плавающий IP для балансировщика нагрузки Load Balancer


#resource "openstack_networking_floatingip_v2" "floatingip_loadbalancer" {
#  pool = "public"
#}












# Создадим для WebADM ассоциацию плавающего IP и порт (публичного и приватного IP адресов)


#resource "openstack_networking_floatingip_associate_v2" "association_webadm" {
#  port_id     = openstack_networking_port_v2.port_webadm.id
#  floating_ip = openstack_networking_floatingip_v2.floatingip_webadm.address
#}

# Создадим для WEB1 ассоциацию плавающего IP и порт (публичного и приватного IP адресов)


#resource "openstack_networking_floatingip_associate_v2" "association_web1" {
#  port_id     = openstack_networking_port_v2.port_web1.id
#  floating_ip = openstack_networking_floatingip_v2.floatingip_web1.address
#}

# Создадим для WEB2 ассоциацию плавающего IP и порт (публичного и приватного IP адресов)


#resource "openstack_networking_floatingip_associate_v2" "association_web2" {
#  port_id     = openstack_networking_port_v2.port_web2.id
#  floating_ip = openstack_networking_floatingip_v2.floatingip_web2.address
#}

# Создадим для Load Balancer ассоциацию плавающего IP и порт (публичного и приватного IP адресов)


#resource "openstack_networking_floatingip_associate_v2" "association_loadbalancer" {
#  port_id     = openstack_networking_port_v2.port_loadbalancer.id
#  floating_ip = openstack_networking_floatingip_v2.floatingip_loadbalancer.address
#}












# Создаём группу безопасности для ICMP


#resource "openstack_networking_secgroup_v2" "secgroup_1" {
#  name = "ICMP"
#  description = "ICMP"
#}

# Создаём группу безопасности для SSH


#resource "openstack_networking_secgroup_v2" "secgroup_2" {
#  name = "SSH"
#  description = "SSH"
#}












# Назначим группы (ICMP, SSH, VPN) безопасности на порт для инстанса WebADM


#resource "openstack_networking_port_secgroup_associate_v2" "security_group_associate_webadm" {
#    port_id            = openstack_networking_port_v2.port_webadm.id
#    enforce            = true
#    security_group_ids = [
#      openstack_networking_secgroup_v2.secgroup_1.id,
#      openstack_networking_secgroup_v2.secgroup_2.id,
#      openstack_networking_secgroup_v2.secgroup_4.id
#    ]
#}

# Назначим группы (ICMP, SSH, WEB) безопасности на порт для инстанса WEB1


#resource "openstack_networking_port_secgroup_associate_v2" "security_group_associate_web1" {
#    port_id            = openstack_networking_port_v2.port_web1.id
#    enforce            = true
#    security_group_ids = [
#      openstack_networking_secgroup_v2.secgroup_1.id,
#      openstack_networking_secgroup_v2.secgroup_2.id,
#      openstack_networking_secgroup_v2.secgroup_3.id
#    ]
#}

# Назначим группы (ICMP, SSH, WEB) безопасности на порт для инстанса WEB2


#resource "openstack_networking_port_secgroup_associate_v2" "security_group_associate_web2" {
#    port_id            = openstack_networking_port_v2.port_web2.id
#    enforce            = true
#    security_group_ids = [
#      openstack_networking_secgroup_v2.secgroup_1.id,
#     openstack_networking_secgroup_v2.secgroup_2.id,
#      openstack_networking_secgroup_v2.secgroup_3.id
#    ]
#}
