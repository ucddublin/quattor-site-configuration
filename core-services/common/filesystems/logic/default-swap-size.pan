template common/filesystems/logic/default-swap-size;
# This IS NOT a filesystem template, but can be included in them to auto-fill the DISK_SWAP_SIZE variable.

# Implements a ruleset based on the following guides:
#    https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Installation_Guide/s2-diskpartrecommend-x86.html
#    https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-disk-partitioning-setup-x86.html#sect-recommended-partitioning-scheme-x86
#
#    <= 2GB          2 times the amount of RAM, but at least 1 GB
#    >  2GB - 8GB    Equal to the amount of RAM
#    >  8GB          Half the amount of RAM, but at least 4 GB

variable DISK_SWAP_DEFAULT ?= 4*GB;
variable DISK_SWAP_SIZE ?= {
    ram_size = 0;

    if (is_defined('/hardware/ram')) {
        foreach (i; v; value('/hardware/ram')) {
            if (is_defined(v['size'])) {
                ram_size = ram_size + v['size'];
            };
        };
    };

    if ( ram_size == 0 ) {
        return(DISK_SWAP_DEFAULT);
    };

    if (ram_size <= 2*GB ) {
        return(max(1*GB, ram_size * 2));
    };

    if (ram_size >= 8*GB ) {
        return(max(4*GB, ram_size / 2));
    };

    ram_size;
};
