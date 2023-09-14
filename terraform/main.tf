# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "stable-diff" {
    
    # VM General Settings
    target_node = "proxmox"
    vmid = "185"
    name = "stable-diff"
    desc = "Image generation machine"
    # VM Advanced General Settings
    onboot = true 
    # VM OS Settings
    clone = "ubuntu-cloud"
    # VM System Settings
    agent = 1
    # VM CPU Settings
    cores = 1
    sockets = 4
    cpu = "host"    
    # VM Memory Settings
    memory = 20480
    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }
    disk {
        storage = "big-storage"
        type = "scsi"
        size = "19660M"
    }

    # IP Address and Gateway
    ipconfig0 = "ip=192.168.0.85/24,gw=192.168.0.1"
    nameserver = "1.1.1.1" 

    # VM Cloud-Init Settings
    #os_type = "cloud-init"

    # (Optional) Default User
    # ciuser = "your-username"
    
    # (Optional) Add your SSH KEY
    # sshkeys = <<EOF
    # #YOUR-PUBLIC-SSH-KEY
    # EOF
}

resource "proxmox_vm_qemu" "web-stable-diff" {
    
    # VM General Settings
    target_node = "proxmox"
    vmid = "184"
    name = "web-stable-diff"
    desc = "Image generation machine with web GUI"
    # VM Advanced General Settings
    onboot = true 
    # VM OS Settings
    clone = "ubuntu-cloud"
    # VM System Settings
    agent = 1
    # VM CPU Settings
    cores = 1
    sockets = 4
    cpu = "host"    
    # VM Memory Settings
    memory = 28610
    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }
    disk {
        storage = "big-storage"
        type = "scsi"
        size = "40140M"
    }
    # IP Address and Gateway
    ipconfig0 = "ip=192.168.0.84/24,gw=192.168.0.1"
    nameserver = "1.1.1.1" 
}
