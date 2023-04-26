unique template service/bootserver/core-services/client/config;

'/system/services/bootserver' = create('servicedata/bootserver/core-services/config');

# Configure bootserver settings manually, not from database as the server is
# not aquilon-managed
'/system/services/bootserver/servers' = append(SELF, 'AQ_HOSTNAME');
'/system/services/bootserver/server_ips' = append(SELF, 'AQ_IP_ADDRESS');
