unique template features/fail2ban/sshd/config;

include 'components/filecopy/config';
include 'components/systemd/config';

# Include iptables configuration for fail2ban
include 'features/fail2ban/sshd/iptables';

# Install fail2ban
'/software/packages' = pkg_repl('fail2ban');

# Enable fail2ban.service and make it part of iptables.service
prefix '/software/components/systemd/unit/{fail2ban.service}';
'name' = 'fail2ban';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;
'file' = dict(
    'config', dict(
        'unit', dict(
            'PartOf', list('iptables.service'),
            'After', list('iptables.service'),
        ),
    ),
);

# Set the default blocktype to DROP which is silent, it is normally REJECT
prefix '/software/components/filecopy/services/{/etc/fail2ban/action.d/iptables-blocktype.local}';
'config' = file_contents('features/fail2ban/sshd/files/iptables-blocktype.local');
'owner' = 'root:root';
'perms' = '0644';
'restart' = '/usr/bin/systemctl reload fail2ban.service';

# Configure actions for fail2ban, this makes it play nicely with existing iptables
# configuration that is independent of fail2ban
prefix '/software/components/filecopy/services/{/etc/fail2ban/action.d/iptables-multiport.local}';
'config' = file_contents('features/fail2ban/sshd/files/iptables-multiport.local');
'owner' = 'root:root';
'perms' = '0644';
'restart' = '/usr/bin/systemctl reload fail2ban.service';

# Configure fail2ban SSHD jail
prefix '/software/components/filecopy/services/{/etc/fail2ban/jail.d/customisation.local}';
'config' = file_contents('features/fail2ban/sshd/files/customisation.local');
'owner' = 'root:root';
'perms' = '0644';
'restart' = '/usr/bin/systemctl reload fail2ban.service';
