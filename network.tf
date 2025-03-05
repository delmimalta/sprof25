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
