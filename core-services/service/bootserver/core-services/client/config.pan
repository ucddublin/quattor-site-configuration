unique template service/bootserver/core-services/client/config;

'/system/services/bootserver' = create('servicedata/bootserver/core-services/config');

# Configure bootserver settings manually, not from database as the server is
# not aquilon-managed
'/system/services/bootserver/servers' = append(SELF, 'aquilon.example.net');
'/system/services/bootserver/server_ips' = append(SELF, '192.168.1.1');
