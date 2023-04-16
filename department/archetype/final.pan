unique template archetype/final;

# Check for placeholder in profile URL in case our logic failed
variable e = if (match(value('/software/components/ccm/profile'), 'PLACEHOLDER_URL')) {
    error('Placeholder found in profile URL - check profileserver service.');
};

# Setup filesystems
include 'archetype/filesystems';

# Setup AII for kickstart, dhcp etc (important that this happens *after* the filesystems have been configured
include 'quattor/aii/config';

# Setup AII package list
'/system/aii/osinstall/ks/packages' = merge(SELF, AII_OSINSTALL_PACKAGES);

# Workaround chicken-and-egg problem of modifying AII package list
variable KS_INSTALL_PACKAGES ?= list();
'/system/aii/osinstall/ks/packages' = merge(SELF, KS_INSTALL_PACKAGES);

# Include admin user ssh config here so EXTRA_ADMINS will be complete
include 'common/core/accounts/admins';

# Include user account and ssh config
include 'common/core/accounts/users';

# Include sshd config here so SSHD_ALLOW_GROUPS will be finalised after user ssh config
include 'common/core/sshd';

# Include late updates to the OS
include 'config/os/updates';

# Check that CPU and OS architectures are the same and err if they are not
variable e = if (value('/hardware/cpu/0/arch') != value('/system/os/architecture')) {
    error('CPU and OS architectures are not compatible.');
};

# Configure repositories
include 'archetype/repository_config';

# This template should be included as last statement in any node profile
include 'components/spma/repository_cleanup';
