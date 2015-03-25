TODO:

* pvc local suspend|stop should turn off manager local mode


# pvcglue-dev-box

## Work in Progress

You have been warned.  :)

## Introduction

This project automates the setup of a development environment for working on pvcglue. Use these virtual machines to work on a pull request or run the test suites.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

Ubuntu (tested with 12.04 and 14.04):  (from https://help.ubuntu.com/community/VirtualBox/Installation)

    sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list" && wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install virtualbox-4.3 dkms

* [Vagrant](http://vagrantup.com)  Must use version 1.7.2 or greater.
 
Ubuntu:  Must install latest version from https://www.vagrantup.com/downloads.html  The version included in Ubuntu is too old.  :(

## How To Build and/or start the virtual machines (See Troubleshooting, below)

    host $ git clone https://github.com/talyric/pvcglue-dev-box.git
    host $ cd pvcglue-dev-box
    host $ pvc local start

After the installation has finished, you can access the virtual machines with the normal pvcglue commands

    host $ pvc local sh
    Welcome to Ubuntu 14.04.1 LTS (GNU/Linux 3.13.0-36-generic i686)
    ...
    vagrant@pvcglue-dev-box:~$

and suspend the virtual machines with

    pvc local suspend
    
or shut them down

    pvc local stop
    
or destroy them all

    pvc local destory
    
or start over again fresh

    pvc local rebuild
   

## Virtual Machines

* manager
* web
* web_2
* lb
* db
* memcached
 
## Troubleshooting

If you see

    A host only network interface you're attempting to configure via DHCP
    already has a conflicting host only adapter with DHCP enabled. The
    DHCP on this adapter is incompatible with the DHCP settings. Two
    host only network interfaces are not allowed to overlap, and each
    host only network interface can have only one DHCP server. Please
    reconfigure your host only network or remove the virtual machine
    using the other host only network.

then run

    VBoxManage dhcpserver remove --netname HostInterfaceNetworking-vboxnet0
    
Thanks to https://github.com/Chassis/Chassis/wiki/dhcp-private_network-failing-on-VirtualBox!
