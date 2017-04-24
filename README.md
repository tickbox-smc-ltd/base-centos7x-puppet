# base-centos7x-puppet
Base development vagrant installation which installs CentOS 7x together with Puppet for provisioning software.

This will install the following on the Guest:

CentOS 7
Puppet
Python 3.6.1
Apache
MySQL

Getting setup
-------------

The only moving piece you need installed on your system is Vagrant: https://www.vagrantup.com/ and Virtualbox https://www.virtualbox.org/

   Install VirtualBox
   Install Vagrant

Puppet does NOT need to be on your workstation since we’re only going to be using it on the VMs that Vagrant spins up.

Vagrantfile
-----------

The Vagrant file is where the creation of the repeatable development environment workflow is controlled. Sets up the network and gets Puppet installed via the Shell Provisioner where the shell script is executed provided here https://github.com/hashicorp/puppet-bootstrap/
