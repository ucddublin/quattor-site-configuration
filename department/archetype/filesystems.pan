template archetype/filesystems;

# If extra partitions are requested we have to restrict the size of the root (/) partition,
# if it is not defined already, give it a sensible value, otherwise we can just let it fill the disk
# it can of course be overridden as needed.
variable DISK_ROOT_SIZE ?= if (length(DISK_EXTRA_PARTITIONS) > 0) 10 * GB;

# FILESYSTEM_LAYOUT should have been set by the time we get here by a combination of archetype and/or features
# Undefine FILESYSTEM_LAYOUT to indicate that the configuration is handled elsewhere and that nothing else should be done here
include FILESYSTEM_LAYOUT;

# Throw an error if we have somehow got here without filesystems!
variable DISK_PARTITIONING ?= error('No filesystem layout specified!');

# Allow data disks to be partitioned, if required
variable DATA_DISK_PARTITIONING ?= dict();
variable DISK_PARTITIONING = merge(SELF, DATA_DISK_PARTITIONING);

# Define xfs default mount options:
# Allow reading and writing
# Do not update inode access time
# Enable 'opportunistic' improvement to the way inline xattrs are stored on-disk
# Allow XFS to create inodes at any location in the filesystem, including those resulting in inode numbers occupying more than 32 bits of significance
# Forcibly turn off all quota accounting and enforcement within the fs
variable DEFAULT_MOUNTOPTS_XFS ?= 'rw,noatime,attr2,inode64,noquota';

# Define xfs default mkfs options:
# Log version 2, 512 B inode size, 4 KiB directory area
variable DEFAULT_MKFSOPTS_XFS ?= '-l version=2 -i size=512 -n size=4096';

# Set partion label type for each physical device in use
'/system/blockdevices/physical_devs' = {
    ph_devs = dict();
    foreach (disk; disk_config; DISK_PARTITIONING) {
        ph_devs = merge(ph_devs, dict(disk, dict('label', disk_config['table'])) )
    };
    ph_devs;
};

function partition_disk = {
    ps = dict();
    foreach (disk; disk_config; DISK_PARTITIONING) {
        foreach (number; partition; disk_config['parts']) {
            ptprefix = if (path_exists(format('/hardware/harddisks/%s/part_prefix', disk)) && is_defined(format('/hardware/harddisks/%s/part_prefix', disk))) {
                value(format('/hardware/harddisks/%s/part_prefix', disk));
            }
            else {
                '';
            };

            pname = disk + ptprefix + to_string(number + 1);

            ptype = if (is_defined(partition['type'])) {
                partition['type'];
            }
            else {
                error('No partition type specified for ' + pname);
            };

            psize = if (is_defined(partition['size'])) {
                partition['size'];
            }
            else {
                null;
            };

            if (!is_null(psize) && psize < 100 * MB) {
                error(format('Partition %s is too small! Partitions should be 100MB or larger.', pname));
            };

            pflags = if (number == 0) {
                if (is_defined(partition['flags'])) {
                    partition['flags'];
                }
                else {
                    null;
                };
            }
            else {
                null;
            };

            poffset = if ((is_defined(partition['offset']))) {
                partition['offset'];
            }
            else {
                null;
            };

            ps[pname] = dict(
                'holding_dev', disk,
                'size', psize,
                'type', ptype,
                'flags', pflags,
                'offset', poffset,
            );
        };
    };
    return(ps);
};

function create_filesystems = {
    fs = list();
    foreach (disk; disk_config; DISK_PARTITIONING) {
        foreach (number; partition; disk_config['parts']) {
            ptprefix = if (path_exists(format('/hardware/harddisks/%s/part_prefix', disk)) && is_defined(format('/hardware/harddisks/%s/part_prefix', disk))) {
                value(format('/hardware/harddisks/%s/part_prefix', disk));
            }
            else {
                '';
            };

            pname = disk + ptprefix + to_string(number + 1);

            ptype = if (is_defined(partition['type'])) {
                partition['type'];
            }
            else {
                error('No partition type specified for ' + pname);
            };

            if (ptype != 'extended' && partition['filesystem'] != 'biosboot') {
                mountpoint = if (is_defined(partition['mountpoint'])) {
                    partition['mountpoint'];
                }
                else {
                    error('No mountpoint specified for ' + pname);
                };

                fstype = if (is_defined(partition['filesystem'])) {
                    partition['filesystem'];
                }
                else {
                    error('No filesystem specified for ' + pname);
                };

                # Apply our local default filesystem tunings where applicable
                default_mkfsopts = if (fstype == 'xfs') {
                    # Log version 2, 1KiB inodes, 4KiB naming area
                    DEFAULT_MKFSOPTS_XFS;
                }
                else {
                    null;
                };

                default_mountopts = if (fstype != 'swap') {
                    # Do not update inode access time
                    'defaults,noatime';
                };

                default_mountopts = if (fstype == 'xfs') {
                    DEFAULT_MOUNTOPTS_XFS;
                }
                else {
                    default_mountopts;
                };

                fs = append(fs, dict(
                    'block_device', format('partitions/%s', pname),
                    'format', true,
                    'preserve', true,
                    'mountpoint', mountpoint,
                    'mount', true,
                    'type', fstype,
                    'mkfsopts', if (is_defined(partition['mkfsopts'])) partition['mkfsopts'] else default_mkfsopts,
                    'mountopts', if (is_defined(partition['mountopts'])) partition['mountopts'] else default_mountopts,
                ));
            };
        };
    };
    return(fs);
};

'/system/blockdevices/partitions' = partition_disk();
'/system/filesystems' = create_filesystems();
