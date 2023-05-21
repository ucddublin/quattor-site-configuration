unique template service/ntp/bud/client/ntpd;

include 'components/ntpd/config';
include 'components/systemd/config';

# Configure ntpd
prefix '/software/components/ntpd';
'servers' = value('/system/services/ntp/servers');
'defaultoptions' = dict('iburst', true);
'disable' = dict('monitor', true);
'driftfile' = '/var/lib/ntp/drift';
'includefile' = '/etc/ntp/crypto/pw';
'keyfile' = '/etc/ntp/keys';

# Enable ntpd and ensure it starts after the dns resolver
prefix '/software/components/systemd/unit/{ntpd.service}';
'name' = 'ntpd';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;
'file' = dict(
    'config', dict(
        'unit', dict(
            'Wants', list('network-online.target'),
            'After', list('network.target', 'network-online.target', 'nss-lookup.target'),
        ),
    ),
);
