# -*- mode: ruby -*-
# vi: set ft=ruby :
# Partnermarketing.com Vagrant sandbox (PHP 5.3)

Vagrant::Config.run do |config|
  config.vm.host_name = "partnermarketing-php53"

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "second2-centos64"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = ""

  # Boot with a GUI so you can see the screen. (Default is headless)
  #config.vm.boot_mode = :gui
  
  config.ssh.max_tries = 50
  config.ssh.timeout   = 300

  # Forward a port from the guest to the host, which allows for outside
  # computers to access the VM, whereas host only networking does not.
  config.vm.forward_port 80, 8000

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path    = 'puppet/modules'
  end
end
