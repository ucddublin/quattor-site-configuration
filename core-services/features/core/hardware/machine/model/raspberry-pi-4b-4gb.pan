unique template features/core/hardware/machine/model/raspberry-pi-4b-4gb;

include 'components/cron/config';
include 'components/filecopy/config';
include 'components/systemd/config';

# Add repository for Raspberry Pi kernels
variable OS_REPOSITORY_LIST = merge(SELF, list(
    format('centos/%s-%s/kernel/rpi2', value('/system/os/version/name'), value('/system/os/architecture')),
    format('centos/%s-%s/kernel/generic', value('/system/os/version/name'), value('/system/os/architecture'))
));

# Install Raspberry Pi kernel, firmware and tools
'/software/packages' = pkg_repl('raspberrypi2-firmware');
'/software/packages' = pkg_repl('raspberrypi2-kernel4');
'/software/packages' = pkg_del('kernel');
'/software/packages' = pkg_del('kernel-tools');
'/software/packages' = pkg_repl('i2c-tools');

# Change partition table type used by Raspberry Pi
variable DEFAULT_PARTITION_TABLE_TYPE = 'msdos';

# Change filesystem used by Raspberry Pi
variable DEFAULT_FILESYSTEM_TYPE = 'ext4';

# Change the '/boot' partition filesystem type
variable DISK_BOOT_FILESYSTEM_TYPE = 'vfat';

# Change the '/boot' partition size
variable DISK_BOOT_SIZE = 286*MB;

# Change the '/boot' partition flags
variable DISK_BOOT_FLAGS = dict('boot', true, 'lba', true);

# Change the '/boot' partition offset, we want an offset of 4 MiB, AII will give
# us an offset of 1 MiB anyway, so we only need 3 MiB more
variable DISK_BOOT_OFFSET = 3*MB;

# Change the 'swap' partition size
variable DISK_SWAP_SIZE = 488*MB;

# Change the '/' partition size
variable DISK_ROOT_SIZE = 10240*MB;

# Add a '/home' partition as SD cards can be quite small, we want room for '/'
variable DISK_EXTRA_PARTITIONS = append(SELF, dict(
    'type', 'primary',
    'size', undef,
    'filesystem', DEFAULT_FILESYSTEM_TYPE,
    'mountpoint', '/home',
));

# Configure Raspberry Pi boot config to disable WiFi, Bluletooth and enable the
# real-time clock: use 'pcf2127' for the 'RasClock V4.2' and 'ds1307' for the
# 'Pi Hut Mini RTC Module'
variable rpi_boot_config = <<EOF;
# CentOS doesn't use any default config options to work,
# this file is provided as a placeholder for user options
# Please read /boot/overlays/README too for additional information

dtoverlay=disable-wifi
dtoverlay=disable-bt
dtparam=i2c_arm=on
dtoverlay=i2c-rtc,pcf2127
EOF

prefix '/software/components/filecopy/services/{/boot/config.txt}';
'config' = rpi_boot_config;
'owner' = 'root:root';
'perms' = '0755';
'backup' = false;

# Install a unit file for the real-time clock
variable rtc_unit_file = <<EOF;
[Unit]
Description=rtc

[Service]
ExecStart=/sbin/hwclock -s
ExecStop=/sbin/hwclock -w
Type=oneshot

[Install]
WantedBy=multi-user.target
EOF

prefix '/software/components/filecopy/services/{/lib/systemd/system/rtc.service}';
'config' = rtc_unit_file;
'owner' = 'root:root';
'perms' = '0644';
'backup' = false;

# Start and enable the real-time clock
prefix '/software/components/systemd/unit/{rtc.service}';
'name' = 'rtc';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

# Make sure filecopy runs before systemd so the unit file is there
'/software/components/systemd/dependencies/pre' ?= list();
'/software/components/systemd/dependencies/pre' = append(SELF, 'filecopy');
