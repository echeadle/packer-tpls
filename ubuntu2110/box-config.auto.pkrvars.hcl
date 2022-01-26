// box-config variable file

boot_cmd          = ["<enter><enter><f6><esc><wait> ", "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/", "<wait><enter>"]
boot_wait_time    = "5s"
disk_size         = 81920
headless_vm       = true
guest_os_type     = "Ubuntu_64"
guest_add_path    = "VBoxGuestAdditions_{{ .Version }}.iso"
http_dir          = "http"
iso_chksum        = "sha256:f8e3086f3cea0fb3fefb29937ab5ed9d19e767079633960ccb50e76153effc98"
iso_urlss          = ["ubuntu-21.10-live-server-amd64.iso", "https://releases.ubuntu.com/21.10/ubuntu-21.10-live-server-amd64.iso"]
shutdown_cmd      = "echo 'vagrant'|sudo -S shutdown -P now"
ssh_username      = "vagrant"
ssh_password      = "vagrant"
ssh_port          = 22
ssh_hndshk_atmpts = "20"
ssh_wait_timeout  = "25m"
vm_name           = "packer-ubuntu-21.10-amd64"

