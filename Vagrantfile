# -*- mode: ruby -*-
# # vi: set ft=ruby :

# Specify minimum Vagrant version and Vagrant API version
VAGRANTFILE_API_VERSION = "2"

system("
    if [[ #{ARGV[0]} = 'up' ]]
    then
        echo 'Running setup.sh..'
        ./setup.sh
    fi
")

# Create boxes
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    ssh_pub_key = File.readlines("./keys/id_rsa.pub").first.strip
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.hostmanager.enabled = true

    ssh_pub_key = File.readlines("./keys/id_rsa.pub").first.strip
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.hostmanager.enabled = true

    config.vm.define "kube-nfs" do |srv|
        srv.vm.box = "bento/centos-7.4"
        srv.vm.network "private_network", ip: "192.168.2.20"
        srv.vm.hostname = "kube-nfs"

        srv.vm.provider :virtualbox do |vb|
            vb.name = "kube-nfs"
            vb.memory = "512"
            vb.gui = false
        end

        srv.vm.provision "shell", inline: <<-SHELL
            sudo echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            sudo grep -v '^127.0.0.1' /etc/hosts > /tmp/hosts
            sudo echo "127.0.0.1   localhost localhost.localdomain" >> /tmp/hosts
            sudo mv /tmp/hosts /etc/host
            sudo chmod 644 /etc/hosts
        SHELL
    end

    config.vm.define "kube1" do |srv|
        srv.vm.box = "bento/centos-7.4"
        srv.vm.network "private_network", ip: "192.168.2.21"
        srv.vm.hostname = "kube1"

        srv.vm.provider :virtualbox do |vb|
            vb.name = "kube1"
            vb.memory = "3072"
            vb.gui = false
        end

        srv.vm.provision "shell", inline: <<-SHELL
            sudo echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            sudo grep -v '^127.0.0.1' /etc/hosts > /tmp/hosts
            sudo echo "127.0.0.1   localhost localhost.localdomain" >> /tmp/hosts
            sudo mv /tmp/hosts /etc/host
            sudo chmod 644 /etc/hosts
        SHELL
    end

    config.vm.define "kube2" do |srv|
        srv.vm.box = "bento/centos-7.4"
        srv.vm.network "private_network", ip: "192.168.2.22"
        srv.vm.hostname = "kube2"

        srv.vm.provider :virtualbox do |vb|
            vb.name = "kube2"
            vb.memory = "4096"
            vb.gui = false
        end

        srv.vm.provision "shell", inline: <<-SHELL
            sudo echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            sudo grep -v '^127.0.0.1' /etc/hosts > /tmp/hosts
            sudo echo "127.0.0.1   localhost localhost.localdomain" >> /tmp/hosts
            sudo mv /tmp/hosts /etc/host
            sudo chmod 644 /etc/hosts
        SHELL
    end
end
