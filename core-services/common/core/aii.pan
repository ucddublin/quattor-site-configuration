unique template common/core/aii;

# Global AII settings
final variable AII_USE_CCM = true;
final variable AII_OSINSTALL_OPTION_LANG ?= 'en_IE.UTF-8';
final variable AII_OSINSTALL_OPTION_KEYBOARD ?= 'ie';
final variable AII_OSINSTALL_OPTION_TIMEZONE ?= 'Europe/Dublin';
final variable AII_OSINSTALL_ROOT = format('/installers/%s', value('/system/os/distribution/name'));

# Fetch kernel and initrd over HTTP rather than TFTP
final variable LPXELINUX = false;

# Indentities of installation servers

# Anaconda & Packages
variable AII_OSINSTALL_SRV = value('/system/services/bootserver/servers/0');

# Kickstart files
variable AII_KS_SRV = value('/system/services/bootserver/servers/0');

# End-of-installation notifications
variable AII_ACK_SRV = value('/system/services/bootserver/servers/0');
