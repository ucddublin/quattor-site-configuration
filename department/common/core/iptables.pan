unique template common/core/iptables;

include 'components/iptables/config';
include 'components/systemd/config';

# Install iptables-services, the iptables daemon
'/software/packages' = pkg_repl('iptables-services');

# Basic set of filters
prefix '/software/components/iptables';

# Define policies
'filter/preamble/input' = 'DROP [0:0]'; # Drop all inbound connections
'filter/preamble/output' = 'ACCEPT [0:0]'; # Accept all outbound connections
'filter/preamble/forward' = 'DROP [0:0]'; # Never forward packets
'filter/ordered_rules' = 'yes';
'filter/epilogue' = 'COMMIT';

# Initialise (but do not overwrite existing) rules list
'filter/rules' ?= list();

# Accept all incoming packets from loopback interface
'filter/rules' = append(SELF, dict(
    'command', '-A',
    'chain', 'INPUT',
    'in-interface', 'lo',
    'jump', 'ACCEPT',
));

# Accept all connections with a example.net cable network address
'filter/rules' = append(SELF, dict(
    'command', '-A',
    'chain', 'INPUT',
    'source', '172.16.0.0/12',
    'jump', 'ACCEPT',
));

# Accept all connections with a example.net wireless network address
'filter/rules' = append(SELF, dict(
    'command', '-A',
    'chain', 'INPUT',
    'source', '192.168.0.0/16',
    'jump', 'ACCEPT',
));

# Accept all incoming packets associated with an established connection
'filter/rules' = append(SELF, dict(
    'command', '-A',
    'chain', 'INPUT',
    'match', 'state',
    'state', 'RELATED,ESTABLISHED',
    'jump', 'ACCEPT',
));

# Ensure iptables is enabled
prefix '/software/components/systemd/unit/{iptables.service}';
'name' = 'iptables';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;
