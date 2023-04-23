unique template os/rocky/8x-x86_64/config;

# Define OS parameters for this vendor
include 'os/rocky/distribution';

# Define OS parameters for this release
prefix '/system/os';
'version/name' = '8x';
'version/major' = 8;
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
final variable SPMA_BACKEND = 'yumdnf';
include 'components/spma/config';

# Install a patched version of ncm-spma that also includes the spmaleaves dnf plugin
'/software/packages' = pkg_repl('ncm-spma', '21.12.1-1', 'noarch');

# Configure network
include 'common/core/network';

# Configure root account
include 'common/core/accounts/root';

# Reintroduce OS_VERSION_PARAMS for the quattor client (need to update TL core)
include 'config/quattor/legacy';

# Configure repositories for installation (kickstart) or general operation (os)
variable REPO_TYPE = 'os';

# Repositories related to base OS and quattor client (should be first)
include 'repository/config/os';

# OS software payload
include 'rpms/payload';

# Default file system for OS
variable DEFAULT_FILESYSTEM_TYPE = 'xfs';

# Configure AII for OS, we use the generic el8 kickstart variant for rocky 8
variable AII_KS_OS_MAJOR_SPECIFIC_INCLUDE = 'quattor/aii/ks/variants/el8';
include 'config/quattor/aii';

# Install the quattor client configuration to host
include 'quattor/client/config';

# Configure SPMA for OS
'/software/components/spma/process_obsoletes' = true;
