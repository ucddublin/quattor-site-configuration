template common/filesystems/extendable;

# Define the '/boot' partition filesystem type
variable DISK_BOOT_FILESYSTEM_TYPE ?= 'ext2';

# Define the '/boot' partition default size
variable DISK_BOOT_SIZE ?= 1024*MB;

# Define the '/' partition default size
variable DISK_ROOT_SIZE ?= if (length(DISK_EXTRA_PARTITIONS) > 0) { 10*GB };

# Define the '/boot' partition default flags
variable DISK_BOOT_FLAGS ?= undef;

# Define the '/boot' partition default offset
variable DISK_BOOT_OFFSET ?= undef;

# Define a list of core OS disk partitions
variable DISK_CORE_PARTITIONS = list(
    dict(
        'type', 'primary',
        'size', DISK_BOOT_SIZE,
        'filesystem', DISK_BOOT_FILESYSTEM_TYPE,
        'mountpoint', '/boot',
        'flags', DISK_BOOT_FLAGS,
        'offset', DISK_BOOT_OFFSET,
    ),

    dict(
        'type', 'primary',
        'size', DISK_SWAP_SIZE,
        'filesystem', 'swap',
        'mountpoint', 'swap',
    ),

    dict(
        'type', 'primary',
        'size', DISK_ROOT_SIZE,
        'filesystem', DEFAULT_FILESYSTEM_TYPE,
        'mountpoint', '/',
    ),
);

# Create a 'bios_grub' partition first if firmware type is bios
variable DISK_CORE_PARTITIONS = if (FW_TYPE == 'bios') {
    prepend(SELF, dict(
        'type', 'primary',
        'size', 100*MB,
        'filesystem', 'biosboot',
        'mountpoint', 'biosboot',
        'flags', dict('bios_grub', true),
    ));
}
else if (FW_TYPE == 'uefi') {
    prepend(SELF, dict(
        'type', 'primary',
        'size', 1024*MB,
        'filesystem', 'vfat',
        'mountpoint', '/boot/efi',
        'flags', dict('boot', true),
    ));
}
else {
    SELF;
};

# Define the complete OS disk partition table and scheme
variable DISK_PARTITIONING = dict(BOOT_DISK, dict(
    'table', DEFAULT_PARTITION_TABLE_TYPE,
    'parts', merge(DISK_CORE_PARTITIONS, DISK_EXTRA_PARTITIONS),
));
