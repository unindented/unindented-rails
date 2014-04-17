Vagrant.configure('2') do |config|

  config.vm.box = 'precise64'
  config.vm.box_url = 'http://files.vagrantup.com/precise64.box'

  config.vm.hostname = "devbox.local"

  config.vm.network :private_network, ip: "192.168.168.168"
  config.vm.usable_port_range = (2200..2250)

  config.vm.provider :virtualbox do |virtualbox|
    virtualbox.customize ["modifyvm", :id, "--name", "devbox"]
    virtualbox.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    virtualbox.customize ["modifyvm", :id, "--memory", "512"]
    virtualbox.customize ["setextradata", :id, "--VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  config.vm.provision :shell, path: "provision/privileged.sh"
  config.vm.provision :shell, path: "provision/unprivileged.sh", privileged: false

  config.ssh.username = "vagrant"

  config.ssh.shell = "bash -l"

  config.ssh.keep_alive = true
  config.ssh.forward_agent = false
  config.ssh.forward_x11 = false

  config.vagrant.host = :detect

end
