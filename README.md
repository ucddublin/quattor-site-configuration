# Quattor Site Configuration

## Description
A collection of Quattor templates for configuring hosts on a computing site.

- [Quattor website](https://www.quattor.org)
- [Contribute to Quattor on GitHub](https://github.com/quattor)

### Supported Operating Systems

This collection of templates supports the CentOS and Rocky Linux distributions for a range of CPU architectures.

#### CentOS
- 7x for x86_64 CPU architecture (Intel 64-bit): Tested
- 7x for aarch64 CPU architecture (ARM 64-bit): Tested

#### Rocky Linux
- 8x for x86_64 CPU architecture (Intel 64-bit): Tested

### Services Configured

- Boot Server - departmental (client only)
- DNS - organisational (client only)
- NTP - organisational (client only)
- Profile Server - departmental (client only)

### Core Configurations

- User and Group accounts
- Root user
- Admin users
- Disk partition table type, partition layout and filesystems created
- SSH server
- SSH user and admin public keys
- Server installation with AII providing automated DHCP, PXE and kickstart configuration

### Core Features Configured

- Cron - control when cron jobs run
- Hardware - automatically apply custom configuration for the following if detected:
    - GPU cards
    - Machine models
    - NIC cards
    - NIC drivers
    - Storage controllers
- Iptables - provides a basic yet extensible set of IP tables rules
- Network - comprehensive client network configuration
- Logrotate - rotation policies of key system logs
- Motd - bespoke message of the day for each host
- Selinux - SELinux policy
- Services - Control of core system daemons with systemd
- Sysadmintools - A collection of all your favourite sysadmin tools

### Other Features Configured

- Mariadb
- GCC
- CUDA
- Fail2Ban
- Apache with TLS
