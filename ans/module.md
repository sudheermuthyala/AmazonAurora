## Modules
- copy
- unarchive
- file
- systemd
- yum
- replace
- community.mongodb.mongodb_shell

```f
- name: Install NodeJS Dependencies
  community.general.npm:
    path: /home/roboshop/{{COMPONENT}}
  become_user: roboshop

- name: Configure Redis YUM repos
  ansible.builtin.dnf:
    name: https://rpms.remirepo.net/enterprise/remi-release-8.rpm
    state: installed
    disable_gpg_check: yes

```
- shell
- user 
- import_role
- import_tasks

- dnf
- ignore_errors
- when (condition)