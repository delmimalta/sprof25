data "template_file" "inventory" {
    template = file("/home/altlinux/bin/_templates/inventory.tpl")
  
    vars = {
        user = "altlinux"
        webadm = join("", [openstack_compute_instance_v2.webadm.name, " ansible_host=", openstack_networking_floatingip_v2.floatingip_webadm.address])
        web1 = join("", [openstack_compute_instance_v2.web1.name, " ansible_host=", openstack_networking_floatingip_v2.floatingip_web1.address])
        web2 = join("", [openstack_compute_instance_v2.web2.name, " ansible_host=", openstack_networking_floatingip_v2.floatingip_web2.address])
    }
}

resource "local_file" "save_inventory" {
   content  = data.template_file.inventory.rendered
   filename = "/home/altlinux/bin/ansible/inventory"
}
