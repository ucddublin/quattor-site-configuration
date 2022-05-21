unique template features/sshd/public/config;

# Declare global variable EDGE_HOST = true to alter SSHD configuration applied
# in 'common/core/sshd'. This will disable authentication by password (only ssh
# key authentication will work), it will not permit the 'root' user to login and
# it will remove the 'root' group from the list of allowed groups in sshd_config
final variable EDGE_HOST = true;
