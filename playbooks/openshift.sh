set -x

# Install KVM
sudo apt install qemu-kvm libvirt-bin -y
sudo gpasswd -a $(whoami) libvirtd -y
sudo newgrp libvirtd

# Install Driver 
curl -L https://github.com/dhiltgen/docker-machine-kvm/releases/download/v0.10.0/docker-machine-driver-kvm-ubuntu14.04 > /usr/local/bin/docker-machine-driver-kvm \ 
sudo chmod +x /usr/local/bin/docker-machine-driver-kvm

# Clone the openshift-ansible repo, which contains the installer.
wget /home/$USER/ https://github.com/minishift/minishift/releases/download/v1.2.0/minishift-1.2.0-linux-amd64.tgz
tar xvzf /home/$USER/minishift-1.2.0-linux-amd64.tgz
sudo mv /home/$USER/minishift .local/bin

#Starting Minishift
sudo minishift start
sudo minishift dashboard
