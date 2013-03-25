# -*- mode: ruby -*-
# vi: set ft=ruby :
# Partnermarketing.com Vagrant sandbox (PHP 5.3)

Vagrant::Config.run do |config|
  config.vm.host_name = "partnermarketing-php53"

  # The base Vagrant/VirtualBox box
  config.vm.box = "partnermarketing-base-centos64"

  # The url for the base Vagrant box
  config.vm.box_url = "https://d1g5lir81f7v7p.cloudfront.net/v2/vagrant/partnermarketing-base-centos64.box"
  #config.vm.box_url = "http://zoidberg/partnermarketing-base-centos64.box"
  #config.vm.box_url = "http://zoidberg/partnermarketing-base-centos64-2.box" # For NFS

  # Boot with a GUI so you can see the screen. (Default is headless)
  #config.vm.boot_mode = :gui
  

  # Boot with a GUI so you can see the screen. (Default is headless)
  #config.vm.boot_mode = :gui

  config.vm.network :hostonly, "192.168.50.4"
  
  # Someone's a bit slow at booting
  config.ssh.max_tries = 50
  config.ssh.timeout = 300

  config.vm.share_folder("v-root", "/vagrant", ".", :nfs => true)
  
  # Someone's a bit slow at booting
  config.ssh.max_tries = 50
  config.ssh.timeout   = 300

  # Forward host:8000 to guest:80
  config.vm.forward_port 80, 8000

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = 'puppet/modules'
  end
end
