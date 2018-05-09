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

    config.vm.define "gfs1" do |srv|
        DISK_NAME = "gfs1.vdi"
        srv.vm.box = "bento/centos-7.4"
        srv.vm.network "private_network", ip: "192.168.2.15"
        srv.vm.hostname = "gfs1"

        srv.vm.provider :virtualbox do |vb|
            vb.name = "gfs1"
            vb.memory = "512"
            vb.gui = false
            unless File.exist?(DISK_NAME)
                vb.customize ['createhd', '--filename', DISK_NAME, '--variant', 'Fixed', '--size', 5 * 1024]
            end
            vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', DISK_NAME]
        end

        srv.vm.provision "shell", inline: <<-SHELL
            sudo echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            sudo grep -v '^127.0.0.1' /etc/hosts > /tmp/hosts
            sudo echo "127.0.0.1   localhost localhost.localdomain" >> /tmp/hosts
            sudo mv /tmp/hosts /etc/host
            sudo chmod 644 /etc/hosts
        SHELL
    end

    config.vm.define "gfs2" do |srv|
        DISK_NAME = "gfs2.vdi"
        srv.vm.box = "bento/centos-7.4"
        srv.vm.network "private_network", ip: "192.168.2.16"
        srv.vm.hostname = "gfs2"

        srv.vm.provider :virtualbox do |vb|
            vb.name = "gfs2"
            vb.memory = "512"
            vb.gui = false
            unless File.exist?(DISK_NAME)
                vb.customize ['createhd', '--filename', DISK_NAME, '--variant', 'Fixed', '--size', 5 * 1024]
            end
            vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', DISK_NAME]
        end

        srv.vm.provision "shell", inline: <<-SHELL
            sudo echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
            sudo grep -v '^127.0.0.1' /etc/hosts > /tmp/hosts
            sudo echo "127.0.0.1   localhost localhost.localdomain" >> /tmp/hosts
            sudo mv /tmp/hosts /etc/host
            sudo chmod 644 /etc/hosts
        SHELL
    end

    config.vm.define "gfs3" do |srv|
        DISK_NAME = "gfs3.vdi"
        srv.vm.box = "bento/centos-7.4"
        srv.vm.network "private_network", ip: "192.168.2.17"
        srv.vm.hostname = "gfs3"

        srv.vm.provider :virtualbox do |vb|
            vb.name = "gfs3"
            vb.memory = "512"
            vb.gui = false
            unless File.exist?(DISK_NAME)
                vb.customize ['createhd', '--filename', DISK_NAME, '--variant', 'Fixed', '--size', 5 * 1024]
            end
            vb.customize ['storageattach', :id,  '--storagectl', 'SATA Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', DISK_NAME]
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
            vb.memory = "2048"
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
            vb.memory = "2048"
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
