${webadm}
${web1}
${web2}

[all:vars]
ansible_ssh_user = ${user}
ansible_ssh_extra_args = '-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
ansible_python_interpreter = /usr/bin/python3
