output "WebADM" {
  value = openstack_networking_floatingip_v2.floatingip_webadm.address
  depends_on = [ openstack_compute_instance_v2.webadm ]
}

output "WEB1" {
  value = openstack_networking_floatingip_v2.floatingip_web1.address
  depends_on = [ openstack_compute_instance_v2.web1 ]
}

output "WEB2" {
  value = openstack_networking_floatingip_v2.floatingip_web2.address
  depends_on = [ openstack_compute_instance_v2.web2 ]
}

output "LoadBalancer" {
  value = openstack_networking_floatingip_v2.floatingip_loadbalancer.address
}
