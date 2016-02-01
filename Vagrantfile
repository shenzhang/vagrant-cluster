# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Box = "ubuntu/trusty64"
Ansible_playbook = "provision/ansible-playbook.yml"
node_number = 3

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    for i in 1..node_number
        node_name = "ubuntu-node-#{i}"
        puts "Begin instance: " + node_name

        # create a instance
        create_instance config, i, node_name
    end
end


def create_instance(config, index, node_name)
    config.vm.define node_name do |machine|
        machine.vm.box = Box
            
        machine.vm.provider :virtualbox do |vb|
            vb.name = node_name
            vb.cpus = 2
            vb.memory = 768
        end
            
        machine.vm.provision :ansible do |ansible|
            ansible.playbook = Ansible_playbook
            ansible.extra_vars = {
                id: index
            }     
        end
            
        # configure network
        ip = 200 + index
        machine.vm.hostname = node_name
        machine.vm.network :private_network, ip: "192.168.3.#{ip}"
    end
end