unique template service/profileserver/core-services/client/config;

'/system/services/profileserver' = create('servicedata/profileserver/core-services/config');

# Configure profileserver settings manually, not from database as the server is
# not aquilon-managed
'/system/services/profileserver/servers' = append(SELF, 'AQ_HOSTNAME');
'/system/services/profileserver/server_ips' = append(SELF, 'AQ_IP_ADDRESS');

# Define profile URL
variable profile_servers = value('/system/services/profileserver/servers');
variable QUATTOR_PROFILE_URL = format('http://%s/profiles', profile_servers[0]);

# Update ccm profile URL which defined in 'quattor/client/config' which in turn
# is included in os/$osvendor/$osname/config
'/software/components/ccm/profile' = format('%s/%s', QUATTOR_PROFILE_URL, QUATTOR_PROFILE_NAME);
