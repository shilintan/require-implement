# install vagrant on windows | macos
wget https://releases.hashicorp.com/vagrant/2.3.0/vagrant_2.3.0_windows_amd64.msi
wget https://releases.hashicorp.com/vagrant/2.3.0/vagrant_2.3.0_darwin_amd64.dmg

# integrate vmware
#vagrant plugin uninstall vagrant-vmware-desktop
#dpkg -r vagrant-vmware-utility
wget https://releases.hashicorp.com/vagrant-vmware-utility/1.0.21/vagrant-vmware-utility_1.0.21_x86_64.deb
dpkg -i vagrant-vmware-utility_1.0.21_x86_64.deb
vagrant plugin install vagrant-vmware-desktop --plugin-clean-sources --plugin-source https://gems.ruby-china.com/ --debug


# vagrant dependency virtualbox,
# vagrant plugin install vagrant-cachier
# vagrant plugin install vagrant-faster
# vagrant plugin uninstall vagrant-faster
# vagrant plugin uninstall   vagrant-vbguest
# vagrant plugin install   vagrant-vbguest --plugin-version 0.24.0.beta1
# or this version:
#vagrant plugin uninstall vagrant-vbguest
#vagrant plugin install vagrant-vbguest --plugin-version 0.21


vagrant init
# default download box to ~/.vagrant.d/boxes, can copy to each other
# remember to set HTTP_PROXY="http://127.0.0.1:51134"  HTTPS_PROXY="http://127.0.0.1:51134" ENVIRONMENT
$env:HTTP_PROXY="http://127.0.0.1:51134"
$env:HTTPS_PROXY="http://127.0.0.1:51134"

# update for your environment:  config.vm.provider, config.vm.network bridge, config.vm.synced_folder
netstat -ntlp | grep ":80 " | awk '{print $7}' | awk -F"/" '{print $1}'|xargs kill
netstat -ntlp | grep ":6443 " | awk '{print $7}' | awk -F"/" '{print $1}'|xargs kill
# if you have conflict the port, please delete the virtual machine
vagrant up --debug
#vagrant rsync-auto

vagrant status

vagrant ssh
# default login user/password is vagrant/vagrant， su root to switch to root user


# reload
vagrant reload
# run below command to stop
vagrant halt
# run below command to destroy
vagrant destroy -f


