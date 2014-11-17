# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "lucid32"
  config.vm.network "forwarded_port", guest: 3000, host: 8080

  config.ssh.username = "vagrant"
  config.ssh.private_key_path = "C:\\Users\\Jarrod\\.vagrant.d\\private_key"

  config.vbguest.auto_update = false

  # Virtual Box GUI for debug
  #config.vm.provider :virtualbox do |vb|
  # vb.gui = true
  #end
end
