unique template features/core/services/ipmi;

include 'components/systemd/config';

# Install OpenIPMI
'/software/packages' = pkg_repl('OpenIPMI');

# Ensure ipmi service is enabled
prefix '/software/components/systemd/unit/{ipmi.service}';
'name' = 'ipmi';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;
