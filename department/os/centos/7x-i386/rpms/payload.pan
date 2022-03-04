unique template rpms/payload;

# Include standard YUM groups for all machines
include 'rpms/group/core';
include 'rpms/group/base';

# Err if trying to install this OS on hardware with a UEFI firmware type
variable e = if (FW_TYPE == 'uefi') {
    error('Hardware with a UEFI firmware type requires a 64-bit operating system.');
};
