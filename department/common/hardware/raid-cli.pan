unique template common/hardware/raid-cli;

# Add RAID CLI repository
variable OS_REPOSITORY_LIST = append(SELF,
    format('site/raidcli/noplt-%s', value('/system/os/architecture'))
);
