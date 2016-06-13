Using this repo
===============


Ansible modes:

**static** vs. **dynamic**
Playbooks can get the target host from a static hosts file `inventories/hosts` or dynamically from `inventories/ec2.py`
The difference is that with dynamic inventory we do not know the host name but we can distinguish between nodes based on Tag / other idneitfier we might set during creation.
An exampel canbe found @: ./playbooks/test-gerrit.yml

```python
---
 - hosts: localhost
   connection: local
   pre_tasks:
   - include_vars: ec2_vars/gerrit.yml
   roles:
    - provision-ec2

 - hosts: localhost
   connection: local
   pre_tasks:
    - include_vars: ec2_vars/jenkins.yml
   roles:
    - provision-ec2

 - hosts: localhost
   connection: local
   pre_tasks:
    - include_vars: ec2_vars/artifactory.yml
   roles:
    - provision-ec2

 - hosts: tag_Name_test_Gerrit
   sudo: true
   pre_tasks:
   - include_vars: ec2_vars/gerrit.yml
   vars:
    # custom smtp configuration
    gerrit_custom_smtp: true
    gerrit_sendemail_smtp_server: 'smtp.office365.com'
    gerrit_smtp_port: 587
    gerrit_smtp_encryption_medhod: 'tls'
    gerrit_smtp_username: 'devopssmtp@audiocodes.com'
    gerrit_smtp_password: 'ilov3AWScloud$' # need to encrypt !
    gerrit_mail_from_addr: 'gerrit@audiocodes.com'
    # session expiration ...
    gerrit_web_sessions_maxage: '1 year'
   roles:
    #- provision-ec2 
    - dns
    - kbrebanov.gerrit

# Jenkins specifc
 - hosts: tag_Name_test_Jenkins
   sudo: true
   tasks:
    - include_vars: ec2_vars/jenkins.yml
   roles:
    #- provision-ec2 
    - dns
    - kbrebanov.git
    - geerlingguy.jenkins
    
# Jenkins specifc
 - hosts: tag_Name_test_Artifactory
   sudo: true
   tasks:
    - include_vars: ec2_vars/artifactory.yml
   roles:
    #- provision-ec2 
    - dns
    - geerlingguy.repo-epel
    - artifactory

```

1. Using static inventory:
-------------------------

`ansible-playbook playbooks/console.yml` will user the default inventory located under `inventories/hosts` and the specified playbooks with the default roles directory `./roles`


2. Using ec2 dynamic inventory:
------------------------------
```
source bin/setenv.sh
ansible-playbook -i inventories/ec2.py playbooks/<ec2-managed-playbook>.yml
```
will user the defeual inventory located under inventories/hosts and the specified playbooks with the default roles directory `./roles`


