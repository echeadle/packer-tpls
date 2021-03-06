packer {
  required_plugins {
    virtualbox = {
      version = ">= 0.0.1"
      source = "github.com/hashicorp/virtualbox"
    }
  }
}


variable "version" {
  type    = string
  default = ""
}

variable "boot_cmd" {
    type = list(string)
    default = []
}

variable "boot_wait_time" {
    type = string
    default = ""
}

variable "disk_size" {
    type = number
    default = 81920
}

variable "headless_vm" {
    type = bool
    default = true
}


variable "guest_os_type" {
    type = string
    default = ""
}

variable "guest_add_path" {
    type = string
    default = ""
}


variable "http_dir" {
    type = string
    default = ""
}

variable "iso_chksum" {
    type = string
    default = ""
}

variable "iso_urlss" {
     type = list(string)
}

variable "shutdown_cmd" {
    type = string
    default = ""
}

variable "ssh_username" {
    type = string
    default = "vagrant"
}
variable "ssh_password" {
    type = string
    default = ""
}

variable "ssh_port" {
    type = number
    default = 22
}

variable "ssh_hndshk_atmpts" {
    type = number 
    default = 20
}

variable "ssh_wait_timeout" {
    type = string
    default = "25m"
}

variable "vm_name" {
    type = string
    default = ""
}



source "virtualbox-iso"  "ubuntu2110" {
  boot_command            = var.boot_cmd
  boot_wait               = "5s"
  disk_size               = var.disk_size
  headless                = var.headless_vm
  guest_os_type           = var.guest_os_type
  guest_additions_path    = var.guest_add_path
  http_directory          = var.http_dir
  iso_checksum            = var.iso_chksum
  iso_urls                = var.iso_urlss
  shutdown_command        = var.shutdown_cmd
  ssh_username            = var.ssh_username
  ssh_password            = var.ssh_password
  ssh_port                = var.ssh_port
  ssh_handshake_attempts  = var.ssh_hndshk_atmpts
  ssh_wait_timeout        = var.ssh_wait_timeout
  vm_name                 = var.vm_name
  vboxmanage              = [["modifyvm", "{{ .Name }}", "--memory", "1024"], ["modifyvm", "{{ .Name }}", "--cpus", "1"]]
  virtualbox_version_file = ".vbox_version"

}

build {
  sources = ["source.virtualbox-iso.ubuntu2110"]

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
      output = "builds/{{ .Provider }}-ubuntu2110.box"
    }
    post-processor "vagrant-cloud" {
      box_tag = "echeadle/ubuntu2110"
      version = "${var.version}"
    }
  }
}
