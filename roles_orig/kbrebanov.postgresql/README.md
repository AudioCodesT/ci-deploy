postgresql
==========

[![Ansible Role](https://img.shields.io/ansible/role/3384.svg)](https://galaxy.ansible.com/list#/roles/3384)

Installs PostgreSQL

Requirements
------------

This role requires Ansible 1.4 or higher.

Role Variables
--------------

| Name               | Default | Description                      |
|--------------------|---------|----------------------------------|
| postgresql_version | 9.4     | Version of PostgreSQL to install |

Dependencies
------------

None

Example Playbook
----------------

Install PostgreSQL
```
- hosts: all
  roles:
    - { role: kbrebanov.postgresql }
```

Install PostgreSQL specifying version
```
- hosts: all
  roles:
    - { role: kbrebanov.postgresql, postgresql_version: 9.3 }
```

License
-------

BSD

Author Information
------------------

Kevin Brebanov
