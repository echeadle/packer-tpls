#!/bin/bash -eux

# Uninstall Ansible and remove PPA.
apt -y remove --purge ansible
apt-add-repository --remove ppa:ansible/ansible

# Apt cleanup.
apt autoremove -y
apt update

#  Blank netplan machine-id (DUID) so machines get unique ID generated on boot.
truncate -s 0 /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id

# Delete unneeded files.
rm -f /home/vagrant/*.sh

# Clean up cloud-init
#sudo touch /etc/cloud/cloud-init.disabled
#dpkg-reconfigure cloud-init
systemctl stop cloud-init
systemctl disable cloud-init
apt-get purge cloud-init -y
apt-get autoremove -y
rm -rf /etc/cloud/
rm -rf /var/lib/cloud/


# Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
s
# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
