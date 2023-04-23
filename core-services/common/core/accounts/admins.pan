unique template common/core/accounts/admins;

include 'components/accounts/config';
include 'components/useraccess/config';

# Get user account keys and config
include 'common/core/accounts/keys-and-config';

# Get user account access control map
include 'common/core/accounts/access-control';

# Initialise gloabal variable EXTRA_ADMINS in case other people need to be
# added in special cases
variable EXTRA_ADMINS ?= list();

# Make James an admin on all systems
variable admin_users = list('james');

# Make group principals admins on their systems
variable admin_users = if (is_defined('/system/owner_eon_id') && exists(HOST_USERACCESS_MAP[format('eon_id_%s', value('/system/owner_eon_id'))]['principals'])) {
    merge(SELF, HOST_USERACCESS_MAP[format('eon_id_%s', value('/system/owner_eon_id'))]['principals']);
}
else {
    SELF;
};

# Create a list of admin public keys
variable admin_keys = list();
variable admin_keys = {
    keys = list();
    admins = list();
    admins = merge(admins, admin_users, EXTRA_ADMINS);
    foreach (i; v; admins) {
        key_list = list();
        foreach (idx; val; ACCOUNT_CONFIG[v]['keys']) {
            key_list = append(key_list, join(' ', ACCOUNT_CONFIG[v]['keys'][idx], ACCOUNT_CONFIG[v]['email']));
        };
        keys = merge(keys, key_list);
    };
    keys;
};

# Add the list of admin public keys to the root user's ssh config
'/software/components/useraccess/users/root/ssh_keys' = admin_keys;
