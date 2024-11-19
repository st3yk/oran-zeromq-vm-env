#! vagrant

# As in the requirements
BOX = bento/ubuntu-22.04

Vagrant.configure("2") do |config|
    config.vm.define "oran-zeromq" do |oz|
        oz.vm.box = BOX
        oz.vm.network "private_network", ip: "192.168.56.150"
        oz.ssh.insert_key = false
        oz.ssh.forward_agent = true
        oz.vm.provider "virtualbox" do |vb|
            vb.memory = 8096
            vb.cpus = 6
            vb.name = "oran-zeromq"
        end
  end
