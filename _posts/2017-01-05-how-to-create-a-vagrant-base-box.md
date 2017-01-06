---
layout: post
title: "How to create a Vagrant Base box"
description: "Simple instruction connected with virtual machines"
tags: [vagrant]
---

Instruction how to create individual [Vagrant](https://www.vagrantup.com/docs/){:target="_blank"} box with all necessary base configs based on [VirtualBox](https://www.virtualbox.org/){:target="_blank"}.

# Create the Virtual Machine with Virtual Box
  - Install VirtualBox
  - Download necessary ISO (I experimented with Ubuntu 16.04)
  - Define virtual machine parameters:
    - Give VM nice name e.g. **Ubuntu16.04**. It'll be used in the futire
    - The first network interface (adapter 1) must be a NAT adapter.
    - For convenience the Virtual Disk should be Dynamic (**VMDK**), so don't bee too stingy with the disk size
  - Install OS
  - Set username and password as **vagrant** (it's a Vagrant convenience)
  - Install **Guest Additions**
    - prepare Linux for building external kernel modules:
{% highlight code bash linenos %}
$ sudo apt-get install dkms
$ sudo /etc/init.d/vboxadd setup
{% endhighlight %}

  -  install the build-essential package and linux headers to compile the Guest Additions property

{% highlight code bash linenos %}
$ sudo apt-get install -y build-essential linux-headers-server
{% endhighlight %}
  - Mount guest additions ISO via VirtualBox window and follow the indications to run the installation script

# Setup guest OS with the minimum necessary
  - Install latest updates
{% highlight bash linenos %}
$ sudo apt-get update -y
$ sudo apt-get upgrade -y
# Restart the machine
$ sudo rebooot
{% endhighlight %}
  - Add the **vagrant** user to sudoers file
{% highlight bash linenos %}
$ sudo su -
$ visudo
# Add the following line to the end of the file.
vagrant ALL=(ALL) NOPASSWD:ALL
{% endhighlight %}
  - Install **Vagrant Public Keys**
{% highlight bash linenos %}
$ mkdir -p /home/vagrant/.ssh
# write public key in /home/vagrant/.ssh/authorized_keys any way what do you like
# Ensure we have the correct permissions set
$ chmod 0700 /home/vagrant/.ssh
$ chmod 0600 /home/vagrant/.ssh/authorized_keys
$ chown -R vagrant /home/vagrant/.ssh
{% endhighlight %}
  - Install OpenSSH Server
{% highlight bash linenos %}
$ sudo apt-get install -y openssh-server
$ sudo vi /etc/ssh/sshd_config
{% endhighlight %}
Ensure the following is set:
  - Port 22
  - PubKeyAuthentication yes
  - AuthorizedKeysFile %h/.ssh/authorized_keys
  - PermitEmptyPasswords no
And restart ssh service
{% highlight bash linenos %}
$ sudo service ssh restart
{% endhighlight %}

# Package the Box
  - Remove those packages that you don't consider necessary (e.g.: LibreOffice)
  - Compact space and shut the VM down
{% highlight bash linenos %}
$ sudo dd if=/dev/zero of=/EMPTY bs=1M
$ sudo rm -f /EMPTY
# Shutdown the machine
$ sudo shutdown now
{% endhighlight %}
  - Create Vagrant Base Box
{% highlight bash linenos %}
# `Ubuntu16.04` your VirtualBox VM nice name
# `ubuntu16.04.box` packed Vagrant box file name
$ vagrant package --base Ubuntu16.04 --output ubuntu16_04.box
{% endhighlight %}
#  Install the box
{% highlight bash linenos %}
$ vagrant box add ubuntu16_04.box
{% endhighlight %}

[Here](http://aruizca.com/steps-to-create-a-vagrant-base-box-with-ubuntu-14-04-desktop-gui-and-virtualbox/){:target="_blank"} is an original instruction.