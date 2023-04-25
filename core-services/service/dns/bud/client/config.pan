unique template service/dns/bud/client/config;

'/system/services/dns' = create('servicedata/dns/bud/config');

include 'components/resolver/config';

# Configure dns settings manually, not from database as the servers are
# not aquilon-managed
'/system/services/dns/servers' = merge(SELF, list('dns0.example.net', 'dns1.example.net'));
'/system/services/dns/server_ips' = merge(SELF, list('192.168.1.2', '192.168.1.3'));

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
