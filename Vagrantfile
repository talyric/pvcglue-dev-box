# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.7.2"
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.

  # config.vm.box = "ubuntu/trusty64" # 14.04 LTS
  config.vm.box = "ubuntu/precise64" # 12.04 LTS
  # config.vm.box = "ubuntu/precise32" # 12.04 LTS

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # We are going to be updating through pvcglue, anyway.
  config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  config.vm.network "public_network"
  config.vm.network "private_network", type: "dhcp"

  config.vm.define "manager", autostart: false do |machine|
  end

  config.vm.define "local-web", primary: true, autostart: false do |machine|
  end
  # config.vm.define "local-web_2", autostart: false do |machine|
  # end
  config.vm.define "local-db", autostart: false do |machine|
  end
  config.vm.define "local-lb", autostart: false do |machine|
  end
  # config.vm.define "local-memcached", autostart: false do |machine|
  # end

  config.vm.define "test-web", autostart: false do |machine|
  end
  config.vm.define "test-web_2", autostart: false do |machine|
  end
  config.vm.define "test-db", autostart: false do |machine|
  end
  config.vm.define "test-lb", autostart: false do |machine|
  end
  config.vm.define "test-memcached", autostart: false do |machine|
  end
  # pvcglue was only designed for 1 cloud manager...may want to refactor later.
  # config.vm.define "test-manager", autostart: false do |machine|
  # end
end
