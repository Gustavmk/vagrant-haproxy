Vagrant.configure("2") do |config|

  NodeCount = 2

  (1..NodeCount).each do |i|
      config.vm.define "haproxy_#{i}" do |haproxy|
          haproxy.vm.box = "oraclelinux/7"
          haproxy.vm.box_url = "https://oracle.github.io/vagrant-projects/boxes/oraclelinux/7.json"
          haproxy.vm.network "private_network", name: "vboxnet0", ip: "192.168.56.1#{i}"
          haproxy.vm.network "private_network", name: "vboxnet1", ip: "192.168.57.1#{i}"
          haproxy.vm.hostname = "haproxy-#{i}"
          # haproxy.vm.provision "file", source: "haproxy.service", destination: "/tmp/haproxy.service"
          # haproxy.vm.provision "file", source: "haproxy.cfg", destination: "/tmp/haproxy.cfg"
          # haproxy.vm.provision "file", source: "keepalived.conf", destination: "/tmp/keepalived.conf"
          haproxy.vm.provision "shell", path: "disable-selinux.sh"
          # haproxy.vm.provision "shell", path: "keepalived.sh"
          # haproxy.vm.provision "shell", path: "haproxy.sh"
          # haproxy.vm.provision "shell", path: "haproxy-postprocessor.sh"
      end
  end

end