# Создаём балансировщик нагрузки с именем "Load Balancer"


resource "openstack_lb_loadbalancer_v2" "loadbalancer" {
  name          = "Load Balancer"
  vip_subnet_id = openstack_networking_subnet_v2.subnet.id

  depends_on = [ 
    openstack_compute_instance_v2.web1,
    openstack_compute_instance_v2.web2
   ]
}












# Создаём правило в балансировщике нагрузки для HTTP


resource "openstack_lb_listener_v2" "listener_http" {
  name            = "HTTP"
  protocol        = "TCP"
  protocol_port   = "80"
  loadbalancer_id = openstack_lb_loadbalancer_v2.loadbalancer.id
}

# Создаём правило в балансировщике нагрузки для HTTPS


resource "openstack_lb_listener_v2" "listener_https" {
  name            = "HTTPS"
  protocol        = "TCP"
  protocol_port   = "443"
  loadbalancer_id = openstack_lb_loadbalancer_v2.loadbalancer.id
}












# Создаём целевую группу для HTTP с указанием алгоритма балансировки "ROUND ROBIN"


resource "openstack_lb_pool_v2" "pool_http" {
  name        = "HTTP"
  protocol    = "HTTP"
  lb_method   = "ROUND_ROBIN"
  listener_id = openstack_lb_listener_v2.listener_http.id
}

# Создаём целевую группу для HTTPS с указанием алгоритма балансировки "ROUND ROBIN"


resource "openstack_lb_pool_v2" "pool_https" {
  name        = "HTTPS"
  protocol    = "HTTPS"
  lb_method   = "ROUND_ROBIN"
  listener_id = openstack_lb_listener_v2.listener_https.id
}












# Добавляем инстанс WEB1  в целевую группу HTTP


resource "openstack_lb_member_v2" "member_web1_http" {
  name          = "WEB1"
  subnet_id     = openstack_networking_subnet_v2.subnet.id
  pool_id       = openstack_lb_pool_v2.pool_http.id
  address       = "192.168.200.21"
  protocol_port = "80"
}

# Добавляем инстанс WEB2  в целевую группу HTTP


resource "openstack_lb_member_v2" "member_web2_http" {
  name          = "WEB2"
  subnet_id     = openstack_networking_subnet_v2.subnet.id
  pool_id       = openstack_lb_pool_v2.pool_http.id
  address       = "192.168.200.22"
  protocol_port = "80"
}

# Добавляем инстанс WEB1  в целевую группу HTTPS


resource "openstack_lb_member_v2" "member_web1_https" {
  name          = "WEB1"
  subnet_id     = openstack_networking_subnet_v2.subnet.id
  pool_id       = openstack_lb_pool_v2.pool_https.id
  address       = "192.168.200.21"
  protocol_port = "80"
}

# Добавляем инстанс WEB2  в целевую группу HTTPS


resource "openstack_lb_member_v2" "member_web2_https" {
  name          = "WEB2"
  subnet_id     = openstack_networking_subnet_v2.subnet.id
  pool_id       = openstack_lb_pool_v2.pool_https.id
  address       = "192.168.200.22"
  protocol_port = "80"
}
