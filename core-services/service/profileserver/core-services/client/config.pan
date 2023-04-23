unique template service/profileserver/core-services/client/config;

'/system/services/profileserver' = create('servicedata/profileserver/core-services/config');

# Configure profileserver settings manually, not from database as the server is
# not aquilon-managed
'/system/services/profileserver/servers' = append(SELF, 'aquilon.example.net');
'/system/services/profileserver/server_ips' = append(SELF, '192.168.1.1');

# Define profile URL
variable profile_servers = value('/system/services/profileserver/servers');
variable QUATTOR_PROFILE_URL = format('http://%s/profiles', profile_servers[0]);

# Update ccm profile URL which defined in 'quattor/client/config' which in turn
# is included in os/$osvendor/$osname/config
'/software/components/ccm/profile' = format('%s/%s', QUATTOR_PROFILE_URL, QUATTOR_PROFILE_NAME);
