
variable "version" {
  type    = string
  default = ""
}

source "virtualbox-iso" "ubuntu2004" {
  boot_command            = ["<enter><enter><f6><esc><wait> ", "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/", "<wait><enter>"]
  boot_wait               = "5s"
  disk_size               = 81920
  guest_additions_path    = "VBoxGuestAdditions_{{ .Version }}.iso"
  guest_os_type           = "Ubuntu_64"
  headless                = true
  http_directory          = "subiquity/http"
  iso_checksum            = "sha256:f8e3086f3cea0fb3fefb29937ab5ed9d19e767079633960ccb50e76153effc98"
  iso_urls                = ["ubuntu-20.04.3-live-server-amd64.iso", "https://www.releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso"]
  shutdown_command        = "echo 'vagrant'|sudo -S shutdown -P now"
  ssh_handshake_attempts  = "20"
  ssh_password            = "vagrant"
  ssh_port                = 22
  ssh_username            = "vagrant"
  ssh_wait_timeout        = "25m"
  vboxmanage              = [["modifyvm", "{{ .Name }}", "--memory", "1024"], ["modifyvm", "{{ .Name }}", "--cpus", "1"]]
  virtualbox_version_file = ".vbox_version"
  vm_name                 = "packer-ubuntu-20.04-amd64"
}

build {
  sources = ["source.virtualbox-iso.ubuntu2004"]

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -S -E bash '{{ .Path }}'"
    script          = "scripts/ansible.sh"
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -S -E bash '{{ .Path }}'"
    script          = "scripts/setup.sh"
  }

  provisioner "ansible-local" {
    galaxy_file   = "../shared/requirements.yml"
    playbook_file = "../shared/main.yml"
  }

  provisioner "shell" {
    execute_command = "echo 'vagrant' | {{ .Vars }} sudo -S -E bash '{{ .Path }}'"
    script          = "scripts/cleanup.sh"
  }

  post-processors {
    post-processor "vagrant" {
      output = "builds/{{ .Provider }}-ubuntu2004.box"
    }
    post-processor "vagrant-cloud" {
      box_tag = "echeadle/ubuntu2004"
      version = "${var.version}"
    }
  }
}
