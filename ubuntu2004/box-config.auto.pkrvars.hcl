// box-config variable file

boot_cmd          = ["<enter><enter><f6><esc><wait> ", "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/", "<wait><enter>"]
boot_wait_time    = "5s"
disk_size         = 81920
headless_vm       = true
guest_os_type     = "Ubuntu_64"
guest_add_path    = "VBoxGuestAdditions_{{ .Version }}.iso"
http_dir          = "subiquity/http"
iso_chksum        = "sha256:f8e3086f3cea0fb3fefb29937ab5ed9d19e767079633960ccb50e76153effc98"
iso_urlss          = ["ubuntu-20.04.3-live-server-amd64.iso", "https://www.releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso"]
shutdown_cmd      = "echo 'vagrant'|sudo -S shutdown -P now"
ssh_username      = "vagrant"
ssh_password      = "vagrant"
ssh_port          = 22
ssh_hndshk_atmpts = "20"
ssh_wait_timeout  = "25m"
vm_name           = "packer-ubuntu-20.04-amd64"
