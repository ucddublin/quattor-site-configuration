unique template service/ntp/organisation/client/chronyd;

include 'components/metaconfig/config';
include 'components/systemd/config';

# Get a list of time servers
final variable time_servers = value('/system/services/ntp/servers');

# Create a data structure of time server configuration
variable time_server_options = list();
variable time_server_options = {
    options = list();
    foreach (i; v; time_servers) {
        options = append(options, dict(
            'hostname', time_servers[i],
            'flags', list('iburst'),
        ));
    };
    options;
};

# Configure chronyd
include 'metaconfig/chrony/config';

prefix '/software/components/metaconfig/services/{/etc/chrony.conf}';
'contents' ?= dict();
'contents' = merge(SELF, dict(
    'server', time_server_options,

    'driftfile', '/var/lib/chrony/drift',

    'makestep', dict(
        'threshold', 1.0,
        'limit', 3,
    ),

    'flags', list('rtcsync'),

    'keyfile', '/etc/chrony.keys',

    'leapsectz', 'right/UTC',

    'logdir', '/var/log/chrony',
));

# Enable and start chronyd
prefix '/software/components/systemd/unit/{chronyd.service}';
'name' = 'chronyd';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;
