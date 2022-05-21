unique template service/ntp/organisation/client/config;

'/system/services/ntp' = create('servicedata/ntp/organisation/config');

# Configure ntp settings manually, not from database as the servers are
# not aquilon-managed
'/system/services/ntp/servers' = merge(SELF, list('ntp0.domain.tld', 'ntp1.domain.tld'));
'/system/services/ntp/server_ips' = merge(SELF, list('192.168.1.4', '192.168.1.5'));

# Include configuration for ntpd for OS major versions <= 7
include if (value('/system/os/version/major') <= 7) 'service/ntp/organisation/client/ntpd';

# Include configuration for chronyd for OS major versions >= 8
include if (value('/system/os/version/major') >= 8) 'service/ntp/organisation/client/chronyd';
