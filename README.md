# Ansible
- [Setup](#setup)
- [Raspberry](#raspberry)

## Setup
Start by cloning this repository 
```
mkdir $HOME/dev/devops
cd $HOME/dev/devops
git clone https://github.com/robipozzi/robipozzi-ansible
cd robipozzi-ansible
```

Ensure environment is correctly configured and do the following:
1. Install Ansible following the instructions at https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html
2. Create **ansible_rsa** SSH key pair in **$HOME/.ssh/** folder
3. Run **[config-ansible.sh](config-ansible.sh)** script that copies **[ansible.cfg](ansible.cfg)** and **[hosts](hosts)** files to */etc/ansible* folder to setup basic Ansible configuration
```
./config-ansible.sh
```
4. On Mac workstation: turn on Remote Login under System Preferences then File Sharing

You can run **[ping.sh](ping.sh)** script to test Ansible is working correctly.
```
./ping.sh
```

## Raspberry
For Ansible to work correctly, SSH public key shall be exchanged with the hosts Ansible manage, run **[ansible-initialize.sh](raspberry/ansible-initialize.sh)** script to copy the public part of Ansible key pair.
```
./ansible-initialize.sh
```

The **[ping.sh](raspberry/ping.sh)** script in *raspberry* folder tries to ping all Raspberry hosts, run it and verify Ansible is able to connect to Raspberry hosts and is working correctly.

The **[raspberry.yaml](raspberry/raspberry.yaml)** playbook is provided to do the following tasks:

- update package manager repo cache and upgrade installed packages on all Raspberry Pi boxes
- install OpenSSL on all Raspberry Pi boxes
- install Docker on all Raspberry Pi boxes
- install Nginx on Raspberry Pi boxes marked as proxies and copy utility scripts for Nginx (provided in the *scripts* sub-folder)
- install Apache2 on Raspberry Pi boxes marked as application servers and copy utility scripts for Apache2 (provided in the *scripts* sub-folder)

Some convenient scripts are provided:
* **[install-docker-role.sh](raspberry/install-docker-role.sh)**, which installs *geerlingguy.docker_arm* role (see Ansible Galaxy https://galaxy.ansible.com/geerlingguy/docker_arm and GitHub Repo https://github.com/geerlingguy/ansible-role-docker_arm for more info) that installs Docker on Linux, specially tailored for ARM-based computers like the Raspberry Pi.
* **[install.sh](raspberry/install.sh)** uses *[raspberry.yaml](raspberry/raspberry.yaml)* playbook to consistently configure Raspberry Pi boxes 
* **[uninstall.sh](raspberry/uninstall.sh)** uses *[raspberry-uninstall.yaml](raspberry/raspberry-uninstall.yaml)* playbook to uninstall custom software from all Raspberry Pi boxes.

Both playbooks refer to yaml files provided in *[conf](raspberry/conf)* sub-folder for common variables setup and usage.