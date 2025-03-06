#!/bin/bash

cd /home/altlinux/bin
source cloud.conf
terraform init
terraform apply -auto-approve
terraform output > /home/altlinux/white.ip
ansible-playbook -i ansible/inventory ansible/wireguard_playbook.yml
ansible-playbook -i ansible/inventory ansible/ssh_playbook.yml

echo "Проверяем доступность созданных инстансов, для каждого инстанса статус должен быть ACTIVE:"
echo ""
openstack --insecure server list

echo "Проверяем доступность созданного балансировщика нагрузки:"
echo ""
openstack --insecure loadbalancer list

echo "Проверяем доступность Web-серверов через балансировщик нагрузки:"
echo ""
openstack --insecure loadbalancer member list HTTP
openstack --insecure loadbalancer member list HTTPS
