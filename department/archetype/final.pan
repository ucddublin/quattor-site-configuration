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
variable e = if (value('/hardware/cpu/0/arch') == 'x86_64') {
    if (value('/system/os/architecture') != 'x86_64' && value('/system/os/architecture') != 'i386') {
        error(format('If CPU architecture is x86_64 then OS architecture must be x86_64 or i386 but CPU is %1$s and OS is %2$s', value('/hardware/cpu/0/arch'), value('/system/os/architecture')));
    };
}
else if (value('/hardware/cpu/0/arch') != value('/system/os/architecture')) {
    error('CPU and OS architectures are not compatible.');
};

# Configure repositories
include 'archetype/repository_config';

# This template should be included as last statement in any node profile
include 'components/spma/repository_cleanup';
