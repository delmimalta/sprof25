# Подключаем в ControlVM интерфейс из подсети "INTERNET" в соответствие с топологией


resource "openstack_compute_interface_attach_v2" "controlvm" {
  instance_id = "96306ddf-a488-4e35-8a8f-25696821efe5"
  network_id  = openstack_networking_network_v2.network.id
  fixed_ip = "192.168.200.10"
  depends_on = [ openstack_networking_subnet_v2.subnet ]
}












# Создаём инстанс с именем "WebADM"


#resource "openstack_compute_instance_v2" "webadm" {
#  name            = "WebADM"
#  flavor_id       = var.flavor_id
#  key_pair        = var.key_pair
#  user_data       = file("cloud-init.yml")

#  block_device {
#    uuid                  = var.image_id
#    source_type           = "image"
#    volume_size           = 10
#    boot_index            = 0
#    destination_type      = "volume"
#    delete_on_termination = true
#  }

#  network {
#    port = openstack_networking_port_v2.port_webadm.id
#  }
#}

# Создаём инстанс с именами "WEB1"


#resource "openstack_compute_instance_v2" "web1" {
#  name            = "WEB1"
#  flavor_id       = var.flavor_id
#  key_pair        = var.key_pair
#  user_data       = file("cloud-init.yml")

#  block_device {
#    uuid                  = var.image_id
#    source_type           = "image"
#    volume_size           = 10
#    boot_index            = 0
#    destination_type      = "volume"
#    delete_on_termination = true
#  }

#  network {
#    port = openstack_networking_port_v2.port_web1.id
#  }
#}

# Создаём инстанс с именами "WEB2"


#resource "openstack_compute_instance_v2" "web2" {
#  name            = "WEB2"
#  flavor_id       = var.flavor_id
#  key_pair        = var.key_pair
#  user_data       = file("cloud-init.yml")

#  block_device {
#    uuid                  = var.image_id
#    source_type           = "image"
#    volume_size           = 10
#    boot_index            = 0
#    destination_type      = "volume"
#    delete_on_termination = true
#  }

#  network {
#    port = openstack_networking_port_v2.port_web2.id
#  }
#}
