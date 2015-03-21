# pvcglue-dev-box

## Work in Progress

You have been warned.  :)

## Introduction

This project automates the setup of a development environment for working on pvcglue. Use this virtual machine to work on a pull request with everything ready run the test suites.

## Requirements

* [VirtualBox](https://www.virtualbox.org)

* [Vagrant](http://vagrantup.com)

## How To Build The Virtual Machine(s)

    host $ git clone https://github.com/talyric/pvcglue-dev-box.git
    host $ cd pvcglue-dev-box
    host $ vagrant up

After the installation has finished, you can access the virtual machine with

    host $ vagrant ssh
    Welcome to Ubuntu 14.04.1 LTS (GNU/Linux 3.13.0-36-generic i686)
    ...
    vagrant@pvcglue-dev-box:~$

## Virtual Machines (not yet implemented)

* pvc_manager
* web_1
* web_2
* lb
* db
* memcached
 

