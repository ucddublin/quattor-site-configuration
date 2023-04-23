unique template features/core/services/config;

include 'components/systemd/config';

# Enable core services on condition(s)
include if (path_exists('/hardware/console/bmc0')) 'features/core/services/ipmi';

# Disable NetworkManager on EL8, could be removed but it is a dependency of a
# core/mandatory package, kexec-tools
include if (value('/system/os/version/major') >= 8) 'features/core/services/network-manager';

# Ensure core services are enabled
prefix '/software/components/systemd/unit/{acpid.service}';
'name' = 'acpid';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{atd.service}';
'name' = 'atd';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{auditd.service}';
'name' = 'auditd';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{cdp-listend.service}';
'name' = 'cdp-listend';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{crond.service}';
'name' = 'crond';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{irqbalance.service}';
'name' = 'irqbalance';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{ncm-cdispd.service}';
'name' = 'ncm-cdispd';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{network.service}';
'name' = 'network';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{rngd.service}';
'name' = 'rngd';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{rsyslog.service}';
'name' = 'rsyslog';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

prefix '/software/components/systemd/unit/{sysstat.service}';
'name' = 'sysstat';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;
