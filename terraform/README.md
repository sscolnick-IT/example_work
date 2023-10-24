Terraform is another favorite tool I have recently started to use for automating the provisioning VM's on my proxmox virtualization server.

I needed to undertake a few tasks to get this up and running. 

1. Create cloud init VM templates on my proxmox server (rock9/ubunutu)
   Images were set up with
   - Cloud init to give the machine unique system information
   - Default ansible users w/ ssh key in order to run my ansible code upon provisioning
   - My favorite default linux applications (vim, screen, bash-completion)
   - The following tutorial from technotim helped me get the ball rolling (https://technotim.live/posts/cloud-init-cloud-image/)

2. Install terraform/set up Promox terraform provider and API token
   - Installing terraform on with homebrew on my mac
   - Setup the API token on my proxmox machine
   - Create a `Provider.tf` file which connects your control node to the hypervisor(proxmox) via an API. This file also makes a call to the `credentials.auto.tf` file containing the hypervisor IP and authentication token
   - Proxmox Provider docs (https://registry.terraform.io/providers/Telmate/proxmox/latest/docs)


3. Write a terraform file which details the VM's I want terraform to deploy on Proxmox. These details include:
   - The image I want to be installed on the VM
   - Hostname, VM-ID Netwokring and IP information
   - VM compute resources and storage location and size
4. Run terraform with:
   - `terraform plan` command to preview any changes which may occur in your infrastructure
   - `terraform apply` will push these these changes into proxmox and keep you updated on deployment status

Since upgrading my homelab to include terraform I have saved endless ammounts of time messing about with setting up/destroying infrastructure and 
cutting out countless manual steps each time I had to set up a new machine (setting up hostnames, IP addressing, etc.).

Now my workflow is: 
  - Dream up infrastructure and write it as code
  - Run terraform to run this code and provision infrastructure on my server
  - Once deployment of new VM's is finished I can go directly run my Ansible playbooks and configure the machine.

Examples of these files can be found in the terraform folder.

     
   
