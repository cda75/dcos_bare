#!/bin/bash

export ANSIBLE_HOST_KEY_CHECKING=False

#Clear known_hots file from existing host keys
while read line; do
    ssh-keygen -f "/root/.ssh/known_hosts" -R $line
    ssh-keyscan -H $line >> ~/.ssh/known_hosts
    sleep 5
    sshpass -p "P@ssw0rd" ssh-copy-id -o StrictHostKeyChecking=no root@$line
done < all_ip
rm -f all_ip

#echo "Waiting for nodes start up"
#sleep 5 

#python generate_key.py

#ansible-playbook docker_install.yaml
#ansible-playbook bootstrap.yaml
#ansible-playbook nodes.yaml



