unique template common/core/sshd;

variable SSH_SCHEMA_VERSION = '7.4';

include 'components/ssh/config';
include 'components/systemd/config';

# Initialise list of allowed groups if not already initialised
variable SSHD_ALLOW_GROUPS ?= list();

# Add the 'ssh' group to the list 'AllowGroups' in /etc/ssh/sshd_config so only
# known users can attempt to login and add 'root' so root can login
variable SSHD_ALLOW_GROUPS = merge(SELF, list('ssh', 'root'));

# Disable printing the MOTD twice on EL8
final variable print_motd = if (value('/system/os/version/major') >= 8) {
    'no';
}
else {
    'yes';
};

# Configure sshd
'/software/components/ssh/daemon/options' = dict(
    'AllowGroups', join(' ', SSHD_ALLOW_GROUPS),
    'AuthorizedKeysFile', '.ssh/authorized_keys',
    'ChallengeResponseAuthentication', 'no',
    'GSSAPIAuthentication', 'yes',
    'GSSAPICleanupCredentials', 'yes',
    'LogLevel', 'VERBOSE',
    'PasswordAuthentication', 'no',
    'PermitEmptyPasswords', 'no',
    'PermitRootLogin', 'without-password',
    'Port', 22,
    'PrintLastLog', 'yes',
    'PrintMotd', print_motd,
    'Protocol', '2',
    'PubkeyAuthentication', 'yes',
    'Subsystem', 'sftp /usr/libexec/openssh/sftp-server',
    'SyslogFacility', 'AUTHPRIV',
    'UsePAM', 'yes',
    'X11Forwarding', 'yes',
);

# Enable sshd service
prefix '/software/components/systemd/unit/{sshd.service}';
'name' = 'sshd';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;
