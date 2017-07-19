set -x

# Install KVM
sudo apt install qemu-kvm libvirt-bin
sudo gpasswd -a $(whoami) libvirtd
newgrp libvirtd

# Install Driver 
curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu14.04 > /usr/local/bin/docker-machine-driver-kvm \ 
chmod +x /usr/local/bin/docker-machine-driver-kvm

# Clone the openshift-ansible repo, which contains the installer.
wget https://github.com/minishift/minishift/releases/download/v1.2.0/minishift-1.2.0-linux-amd64.tgz
tar xvzf minishift-1.2.0-linux-amd64.tgz
mv minishift .local/bin

#Starting Minishift
minishift start
minishift dashboard
