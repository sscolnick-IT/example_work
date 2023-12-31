Anisible is one of my favorite IAAC tools for both automating different server/worksation configurations and  administrating multiple servers all at the same time from a single source. 
When pairing with version control such as gitlab/github, I can not only can I track the changes I have made across my servers but I can automate changes pushed to my repo with CI/CD pipelines.

The Ansible folder in this repo contains some of the playbooks/roles I have built inorder to configure my servers I have running on my Promox Virtualization server. 

Roles/playbooks Ive written:

- BIND local DNS server 
    - Playbook for creating both primary/slave local DNS server
    - Automated DNS record updates via CI/CD pipelines

- Stable diffusion AI image generation server - https://github.com/bes-dev/stable_diffusion.openvino
    - Playbook for installing Stable Diffusion and a python environment to run it in 
    - Additional webserver for displaying AI generated images on my local network (https://github.com/legend80s/gallery-server)
    - Bash script for running longer batch jobs which I could leave overnight as the images rendered. 

Upcoming roles and playbooks

- Gitlab runner server 
    - Will recieve code changes pushed to gitlab and automate those changes to the correct machines via Ansible docker image which 
- Stable diffusion AI image generator with webUI - https://github.com/AUTOMATIC1111/stable-diffusion-webui
