unique template common/core/sshd;

variable SSH_SCHEMA_VERSION = '7.4';

include 'components/ssh/config';
include 'components/systemd/config';

# Only allow authentication by password if the host is not edge facing
variable password_auth = if (is_defined(EDGE_HOST) && EDGE_HOST == true) 'no';
variable password_auth ?= 'yes';

# Only allow root login (and only via public key authentication) if the host is
# not edge facing
variable permit_root_login = if (is_defined(EDGE_HOST) && EDGE_HOST == true) 'no';
variable permit_root_login ?= 'without-password';

# Initialise list of allowed groups if not already initialised
variable SSHD_ALLOW_GROUPS ?= list();

# Add the 'ssh' group to the list 'AllowGroups' in /etc/ssh/sshd_config so only
# known users can attempt to login
variable SSHD_ALLOW_GROUPS = append(SELF, 'ssh');

# Add the 'root' group to the list 'AllowGroups' in /etc/ssh/sshd_config if the
# host is not edge facing
variable SSHD_ALLOW_GROUPS = if (is_defined(EDGE_HOST) && EDGE_HOST == true) {
    SELF;
}
else {
    append(SELF, 'root');
};

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
    'PasswordAuthentication', password_auth,
    'PermitEmptyPasswords', 'no',
    'PermitRootLogin', permit_root_login,
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
