TODO:

* pvc local suspend|stop should turn off manager local mode


# pvcglue-dev-box

## Work in Progress

You have been warned.  :)

## Introduction

This project automates the setup of a development environment for working on pvcglue. Use these virtual machines to work on a pull request or run the test suites.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

Ubuntu:  (from https://help.ubuntu.com/community/VirtualBox/Installation)

    sudo sh -c "echo 'deb http://download.virtualbox.org/virtualbox/debian '$(lsb_release -cs)' contrib non-free' > /etc/apt/sources.list.d/virtualbox.list" && wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install virtualbox-4.3 dkms

* [Vagrant](http://vagrantup.com)

## How To Build The Virtual Machine(s)

    host $ git clone https://github.com/talyric/pvcglue-dev-box.git
    host $ cd pvcglue-dev-box
    host $ pvc local start

After the installation has finished, you can access the virtual machines with the normal pvcglue commands

    host $ vagrant ssh
    Welcome to Ubuntu 14.04.1 LTS (GNU/Linux 3.13.0-36-generic i686)
    ...
    vagrant@pvcglue-dev-box:~$

## Virtual Machines

* manager
* web
* web_2
* lb
* db
* memcached
 

