unique template rpms/payload;

# Include standard YUM groups for all machines
include 'rpms/group/core';
include 'rpms/group/base';

# Install additional packages for machines with a UEFI firmware type
include if (FW_TYPE == 'uefi') 'rpms/uefi-boot';
