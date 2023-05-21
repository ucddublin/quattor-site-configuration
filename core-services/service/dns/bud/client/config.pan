unique template service/dns/bud/client/config;

'/system/services/dns' = create('servicedata/dns/bud/config');

include 'components/resolver/config';

# Configure dns settings manually, not from database as the servers are
# not aquilon-managed
'/system/services/dns/servers' = merge(SELF, list('DNS_HOSTNAME'));
'/system/services/dns/server_ips' = merge(SELF, list('DNS_IP_ADDRESS'));

# Configure the name server list
'/system/network/nameserver' = value('/system/services/dns/server_ips');

# Configure the resolver
'/software/components/resolver' = dict(
    'servers', value('/system/services/dns/server_ips'),
    'search', list(
        value('/system/network/domainname'),
    ),
    'dispatch', true,
);
