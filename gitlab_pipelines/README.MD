My current DNS CI/CD Pipline consists of a few steps. 

1. Push changes from my local repository to the Gitlab repo hosted on gitlab.com 
2. If any of the changes pushed in my last commits trigger a condition in the Gitlab CI file this will cause the code to be pushed to a gitlab runner VM hosted on my local virtualization server (proxmox).

Rule in question from the CI file. If any changes are made the files in the templates in the DNS Ansible role are committed to the main branch it will trigger the gitlab runner to run the rest of the CI file. 
    ```
      rules:
        - if: '$CI_COMMIT_REF_NAME == "main"'
          changes:
            - roles/dns_server/templates/**/* 
    ```

![alt text](https://github.com/sscolnick-IT/example_work/blob/main/gitlab_pipelines/DNS_update_pipeline.png?raw=true)
