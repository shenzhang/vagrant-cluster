#!/bin/sh

ansible-playbook --private-key=.vagrant/machines/default/virtualbox/private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory playbook.yml
