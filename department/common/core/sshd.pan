unique template common/core/sshd;

variable SSH_SCHEMA_VERSION = '7.4';

include 'components/ssh/config';
include 'components/systemd/config';

# Initialise list of allowed groups
variable SSHD_ALLOW_GROUPS ?= list();

# Only allow authentication by password if the host is not public facing
variable password_authentication = if (is_defined(SSHD_DISABLE_PASSWORD_LOGIN) && SSHD_DISABLE_PASSWORD_LOGIN == true) 'no';
variable password_authentication ?= 'yes';

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
    'PasswordAuthentication', password_authentication,
    'PermitEmptyPasswords', 'no',
    'PermitRootLogin', 'no',
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
