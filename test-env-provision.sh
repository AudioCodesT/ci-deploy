#!/bin/bash

ansible-playbook -vv -i localhost, -e "type=artifactory" test-env-provision.yml
ansible-playbook -vv -i localhost, -e "type=jenkins" test-env-provision.yml
ansible-playbook -vv -i localhost, -e "type=gerrit" test-env-provision.yml
