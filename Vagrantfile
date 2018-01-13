Vagrant.configure("2") do |config|
  config.vm.define "server1" do |server1|
    server1.vm.box = "ubuntu/precise64"
    server1.vm.hostname = 'server1'
    server1.vm.box_url = "ubuntu/precise64"
    
    server1.vm.network :private_network, ip: "192.168.56.101"

   end

   config.vm.define "server2" do |server2|
    server2.vm.box = "precise64"
    server2.vm.hostname = 'server2'
    server2.vm.box_url = "ubuntu/precise64"

    automate.vm.network :private_network, ip: "192.168.56.102"
end
end
