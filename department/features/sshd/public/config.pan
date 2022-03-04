unique template features/sshd/public/config;

# Declare global variable SSHD_DISABLE_PASSWORD_LOGIN = true to alter SSHD
# configuration applied in 'common/core/sshd' and disable authentication by
# password, thus mandating the use of ssh keys
final variable SSHD_DISABLE_PASSWORD_LOGIN = true;
