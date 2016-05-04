mysql
=====

[![Ansible Role](https://img.shields.io/ansible/role/4995.svg)](https://galaxy.ansible.com/list#/roles/4995)

Installs and configures MySQL

Requirements
------------

This role requires Ansible 1.6 or higher.

Role Variables
--------------

| Name                                        | Default   | Description                                                                                                                                                                              |
|---------------------------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mysql_version                               | 5.6       | Version of MySQL to install                                                                                                                                                              |
| mysql_root_password                         | password  | MySQL root password                                                                                                                                                                      |
| mysql_client_port                           | 3306      | MySQL client port                                                                                                                                                                        |
| mysql_mysqld_safe_nice                      | 0         | Nice value of mysqld process                                                                                                                                                             |
| mysql_mysqld_bind_address                   | 127.0.0.1 | Address that MySQL server will listen on                                                                                                                                                 |
| mysql_mysqld_character_set_server           | utf8      | Default character set                                                                                                                                                                    |
| mysql_mysqld_collation_server               | utf8_bin  | Default server collation                                                                                                                                                                 |
| mysql_mysqld_expire_logs_days               | 0         | The number of days for automatic binary log file removal. The default is 0, which means "no automatic removal"                                                                           |
| mysql_mysqld_max_allowed_packet             | 4M        | The maximum size of one packet                                                                                                                                                           |
| mysql_mysqld_max_binlog_size                | 1G        | The maximum size of binary log file                                                                                                                                                      |
| mysql_mysqld_max_connections                | 151       | The maximum permitted number of simultaneous client connections                                                                                                                          |
| mysql_mysqld_port                           | 3306      | MySQL server port                                                                                                                                                                        |
| mysql_mysqld_query_cache_limit              | 1M        | Do not cache results that are larger than this number of bytes                                                                                                                           |
| mysql_mysqld_query_cache_size               | 0         | The amount of memory allocated for caching query results                                                                                                                                 |
| mysql_mysqld_thread_cache_size              | 8         | How many threads the server should cache for reuse                                                                                                                                       |
| mysql_mysqld_thread_stack                   | 192K      | The stack size for each thread                                                                                                                                                           |
| mysql_mysqld_innodb_buffer_pool_size        | 128M      | The size in bytes of the buffer pool, the memory area where InnoDB caches table and index data                                                                                           |
| mysql_mysqld_innodb_file_per_table          | ON        | When enabled, InnoDB stores the data and indexes for each newly created table in a separate .ibd file                                                                                    |
| mysql_mysqld_innodb_flush_log_at_trx_commit | 1         | Controls the balance between strict ACID compliance for commit operations, and higher performance that is possible when commit-related I/O operations are rearranged and done in batches |
| mysql_mysqld_innodb_log_buffer_size         | 8M        | The size in bytes of the buffer that InnoDB uses to write to the log files on disk                                                                                                       |
| mysql_mysqld_innodb_log_file_size           | 48M       | The size in bytes of each log file in a log group                                                                                                                                        |
| mysql_mysqldump_quick                       | True      | Retrieve rows for a table from the server a row at a time                                                                                                                                |
| mysql_mysqldump_quote_names                 | True      | Quote identifiers within backtick characters                                                                                                                                             |
| mysql_mysqldump_max_allowed_packet          | 16M       | Maximum packet length to send to or receive from server                                                                                                                                  |

Dependencies
------------

None

Example Playbook
----------------

Install MySQL
```
- hosts: all
  roles:
    - { role: kbrebanov.mysql }
```

Install MySQL and specify bind address
```
- hosts: all
  roles:
    - { role: kbrebanov.mysql, mysql_mysqld_bind_address: 192.168.1.10 }
```

License
-------

BSD

Author Information
------------------

Kevin Brebanov
