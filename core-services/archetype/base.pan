unique template archetype/base;

# Include profile_base for the profile structure
include 'quattor/profile_base';

# Assign the archetype name from the variables in the declarations template
'/system/archetype/name' = ARCHETYPE;

# Define the snapshot value and assign the site release that value
final variable SNAPSHOT = '2023-03-17';
'/system/siterelease' = SNAPSHOT;

# Configure Automatic Installation Infrastructure, AII
final variable AII_CONFIG_SITE = 'common/core/aii';

# Configure Quattor profile format
variable QUATTOR_PROFILE_FORMAT = 'json';

# Configure Quattor profile URL
# Assign a placeholder value for now, so the quattor/client logic does not
# complain of an undefined value, this will be over-written later by the
# profileserver service
variable QUATTOR_PROFILE_URL = 'PLACEHOLDER_URL';

# Initialise empty cluster/name definition
'/system/cluster/name' ?= '';

# Initialise empty kernel definition
'/system/kernel' ?= dict();

# Include important functions
include 'archetype/functions';

# Include configuration which extracts knowledge of the machine's hardware
include 'archetype/hardware';

# Configure filesystems

# Provide empty list for extra filesystems if needed
variable DISK_EXTRA_PARTITIONS = list();

# Configure a default filesystem suitable for any OS deployment, this should be
# over-ridden in the appropriate os/NAME/VERSION/config template if required
variable DEFAULT_FILESYSTEM_TYPE = 'ext3';

# Use gpt partition tables as standard, this can be over-ridden if required
variable DEFAULT_PARTITION_TABLE_TYPE = 'gpt';

# Use logic to auto-generate the size of the swap partition
include 'common/filesystems/logic/default-swap-size';

# Define a default filesystem layout that can be extended if required
variable FILESYSTEM_LAYOUT = 'common/filesystems/extendable';

# Configure root mail address
'/system/rootmail' ?= 'root@aquilon.example.net';
