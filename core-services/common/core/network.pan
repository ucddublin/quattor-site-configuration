unique template common/core/network;

include 'components/network/config';

# Network configuration
final variable HOSTNAME = hostname_from_object();
final variable DOMAIN = domain_from_object();
final variable FULL_HOSTNAME = OBJECT;
final variable PRIMARY_IP = value('/system/network/primary_ip');

'/system/network/domainname' = DOMAIN;
'/system/network/hostname' = HOSTNAME;

# Enforce all network device name <-> mac mapping by default
'/system/network/set_hwaddr' ?= true;
