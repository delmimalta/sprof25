# Создаём балансировщик нагрузки с именем "Load Balancer"
resource "openstack_lb_loadbalancer_v2" "loadbalancer" {
  name          = "Load Balancer"
  vip_subnet_id = openstack_networking_subnet_v2.subnet.id

  depends_on = [ 
    openstack_compute_instance_v2.web1,
    openstack_compute_instance_v2.web2
   ]
}
