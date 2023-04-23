unique template os/centos/7x-x86_64/config;

# Define OS parameters for this vendor
include 'os/centos/distribution';

# Define OS parameters for this release
prefix '/system/os';
'version/name' = '7x';
'version/major' = 7;
'architecture' = 'x86_64';

# Define OS Loadpath
variable LOADPATH = append(SELF, format('%s/os/%s/%s-%s',
    ARCHETYPE,
    value('/system/os/distribution/name'),
    value('/system/os/version/name'),
    value('/system/os/architecture')
));

# Define traditionally used global variables in terms of the OS configuration in the profile
variable NODE_OS_VERSION_DEFAULT = format('%s-%s-%s', value('/system/os/distribution/name'), value('/system/os/version/name'), value('/system/os/architecture'));
variable NODE_OS_VERSION = NODE_OS_VERSION_DEFAULT;
variable PKG_ARCH_DEFAULT = value('/system/os/architecture');
variable OS_PLATFORM = format('%s%s', value('/system/os/distribution/family'), value('/system/os/version/major'));

# Configure package manager
include 'components/spma/config';

# Configure network
include 'common/core/network';

# Configure root account
include 'common/core/accounts/root';

# Reintroduce OS_VERSION_PARAMS for the quattor client (need to update TL core)
include 'config/quattor/legacy';

# Repositories related to base OS and quattor client (should be first)
include 'repository/config/os';

# OS software payload
include 'rpms/payload';

# Default file system for OS
variable DEFAULT_FILESYSTEM_TYPE = 'xfs';

# Configure AII for OS, we use the generic el7 kickstart variant for centos 7
variable AII_KS_OS_MAJOR_SPECIFIC_INCLUDE = 'quattor/aii/ks/variants/el7';
include 'config/quattor/aii';

# Install the quattor client configuration to host
include 'quattor/client/config';

# Configure SPMA for OS
'/software/components/spma/process_obsoletes' = true;
