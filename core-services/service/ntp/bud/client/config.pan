unique template service/ntp/bud/client/config;

'/system/services/ntp' = create('servicedata/ntp/bud/config');

# Configure ntp settings manually, not from database as the servers are
# not aquilon-managed
'/system/services/ntp/servers' = merge(SELF, list('NTP_HOSTNAME'));
'/system/services/ntp/server_ips' = merge(SELF, list('NTP_IP_ADDRESS'));

# Include configuration for ntpd for OS major versions <= 7
include if (value('/system/os/version/major') <= 7) 'service/ntp/bud/client/ntpd';

# Include configuration for chronyd for OS major versions >= 8
include if (value('/system/os/version/major') >= 8) 'service/ntp/bud/client/chronyd';
