unique template features/core/services/network-manager;

include 'components/systemd/config';

# Disable NetworkManager
prefix '/software/components/systemd/unit/{NetworkManager.service}';
'name' = 'NetworkManager';
'type' = 'service';
'state' = 'disabled';
'startstop' = true;
