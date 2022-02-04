// box-config variable file
boot_cmd      =  [
                " <wait>",
                " <wait>",
                " <wait>",
                " <wait>",
                " <wait>",
                "c",
                "<wait>",
                "set gfxpayload=keep",
                "<enter><wait>",
                "linux /casper/vmlinuz quiet<wait>",
                " autoinstall<wait>",
                " ds=nocloud-net<wait>",
                "\\;s=http://<wait>",
                "{{.HTTPIP}}<wait>",
                ":{{.HTTPPort}}/<wait>",
                " ---",
                "<enter><wait>",
                "initrd /casper/initrd<wait>",
                "<enter><wait>",
                "boot<enter><wait>"]
boot_wait_time    = "5s"
disk_size         = 81920
headless_vm       = false
guest_os_type     = "Ubuntu_64"
guest_add_path    = "VBoxGuestAdditions_{{ .Version }}.iso"
http_dir          = "http"
iso_chksum        = "sha256:e84f546dfc6743f24e8b1e15db9cc2d2c698ec57d9adfb852971772d1ce692d4"
iso_urlss         = ["ubuntu-21.10-live-server-amd64.iso", "https://releases.ubuntu.com/21.10/ubuntu-21.10-live-server-amd64.iso"]
shutdown_cmd      = "echo 'vagrant'|sudo -S shutdown -P now"
ssh_username      = "vagrant"
ssh_password      = "vagrant"
ssh_port          = 22
ssh_hndshk_atmpts = "20"
ssh_wait_timeout  = "25m"
vm_name           = "packer-ubuntu-21.10-amd64"

