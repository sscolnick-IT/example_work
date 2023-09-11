This is my ansible repo of playbooks and for various services I have set up on my proxmox vitualization server.

Roles/playbooks Ive written:

    BIND local DNS server
        Playbook for creating both primary/redundant DNS server
        Automated changes via Gitlab CI/CD pipeline to push record changes

    Stable diffusion AI image generation server - https://github.com/bes-dev/stable_diffusion.openvino
        Playbook for installing Stable Diffusion and additional webserver for image display

Upcoming roles and playbooks

    gitlab runner for automating ansible changes
    Stable diffusion with webUI - https://github.com/AUTOMATIC1111/stable-diffusion-webui

