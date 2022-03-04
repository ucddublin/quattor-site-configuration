unique template common/core/accounts/root;

include 'components/accounts/config';

# Get account access map
include 'common/core/accounts/access-control';

# Set 'root' password
'/software/components/accounts/rootpwd' = if (is_defined('/system/owner_eon_id') && exists(HOST_USERACCESS_MAP[format('eon_id_%s', value('/system/owner_eon_id'))]['root_pw'])) {
    HOST_USERACCESS_MAP[format('eon_id_%s', value('/system/owner_eon_id'))]['root_pw'];
}
else {
    HOST_USERACCESS_MAP['defaults']['root_pw'];
};

'/software/components/accounts/shadowpwd' = true;
