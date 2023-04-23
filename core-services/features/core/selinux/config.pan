unique template features/core/selinux/config;

include 'components/filecopy/config';

# Correct the file contents for the OS major version
variable selinux_config_inserted_text = if (value('/system/os/version/major') <= 7) {
    ' ';
}
else {
    ' these ';
};

# Install the file on the host
prefix '/software/components/filecopy/services/{/etc/selinux/config}';
'config' = format(file_contents('features/core/selinux/files/config'), selinux_config_inserted_text);
'owner' = 'root:root';
'perms' = '0644';
