
I was tired of logging into my DNS server to add new changes to my DNS records so I set up a CI/CD pipeline so that I can make changes to the DNS records in my ansible repo that would automatically conifgure these changes on my DNS server when pushed to gitlab. My current DNS CI/CD Pipline consists of a few steps. 

1. Push changes from my local repository to the Gitlab repo hosted on gitlab.com 

2. If any of the changes pushed in my last commits trigger a condition in the Gitlab CI file this will cause the code to be pushed to a gitlab runner VM hosted on my local virtualization server (proxmox).

Rule in question from the CI file. If any changes are made the files in the templates in the DNS Ansible role are committed to the main branch it will trigger the gitlab runner to run the rest of the CI file. 
```

      rules:
        - if: '$CI_COMMIT_REF_NAME == "main"'
          changes:
            - roles/dns_server/templates/**/* 

```
3. The code from the CI file will trigger a docker container to spin up on the gitlab runner VM. This container will be become the ansible control node and is able to run playbooks. There is some initial set up to getting the container running such as copying SSH Keys that will allow the control node to connect to the DNS server VM.  

```
    deploy_dns:
      stage: deploy_dns
      image: finalgene/ansible:latest
      before_script:
        - 'which ssh-agent || ( apt-get install -qq openssh-client )'
        - eval $(ssh-agent -s)
        - ssh-add <(cat "$SSH_KEY")
        - mkdir -p ~/.ssh
        - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
        - chmod -v 744 $(pwd
```

4. The ansible container will run the playbook dns.yml against the target machine, in this case my local DNS server.

```
  script:
    - 'ansible-playbook dns.yml -l dns-01'
```
 I will receive an email notification whether the pipeline run successfully or if there was an issue. 


![alt text](https://github.com/sscolnick-IT/example_work/blob/main/gitlab_pipelines/DNS_update_pipeline.png?raw=true)
