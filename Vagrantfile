require 'yaml'

Vagrant.configure(2) do |config|
  config.vm.provider "virtualbox" do |v|
    v.memory = 3072
    v.cpus = 4
    v.name = "nulldevelopmenthr-dockerimages"
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "nulldevelopmenthr-dockerimages"

  config.vm.network 'private_network', ip: '192.168.18.1'

  config.vm.synced_folder './', '/vagrant', id: 'application', type: "nfs"


  config.vm.provision :ansible do |ansible|
    ansible.playbook = "etc/provisioning/setup.yml"
    ansible.groups = {
      "vagrant" => ["default"],
      "servers:children" => ["vagrant"]
    }
    ansible.extra_vars = {
      "private_ip" => "127.0.0.1"
    }    
    ansible.verbose = true
    ansible.limit = 'all'
    ansible.sudo = true
    ansible.sudo_user = "root"
  end
end
