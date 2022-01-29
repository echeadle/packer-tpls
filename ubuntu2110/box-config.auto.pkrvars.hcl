// box-config variable file


boot_cmd = ["<esc><esc><enter><wait>",
 "<f6><esc>",
                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                "<bs><bs><bs><bs><bs><bs><bs><bs><bs><bs>",
                "c",
                "set gfxpayload=keep",
                "/ubuntu/casper/vmlinuz  ---",
                "/ubuntu/initrd=/casper/initrd autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/  <wait> --- <enter>" ]
                #"autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/  <wait> --- <enter>" ]

boot_wait_time    = "5s"
disk_size         = 81920
headless_vm       = true
guest_os_type     = "Ubuntu_64"
guest_add_path    = "VBoxGuestAdditions_{{ .Version }}.iso"
http_dir          = "http"
#iso_chksum        = "sha256:f8e3086f3cea0fb3fefb29937ab5ed9d19e767079633960ccb50e76153effc98"
iso_chksum        = "sha256:11fb93ed590af474274d7f7d50ea5eec8e0edefd423c7109458df8eb97adccf4"
#iso_urlss         = ["ubuntu-21.10-live-server-amd64.iso", "https://releases.ubuntu.com/21.10/ubuntu-21.10-live-server-amd64.iso"]
iso_urlss         = ["ubun2110/ubuntu-21.10.0-2022.01.28-live-server-amd64.iso"]
shutdown_cmd      = "echo 'vagrant'|sudo -S shutdown -P now"
ssh_username      = "vagrant"
ssh_password      = "vagrant"
ssh_port          = 22
ssh_hndshk_atmpts = "20"
ssh_wait_timeout  = "25m"
vm_name           = "packer-ubuntu-21.10-amd64"

