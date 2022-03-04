unique template common/core/accounts/users;

include 'components/accounts/config';
include 'components/useraccess/config';

# Get user account keys and config
include 'common/core/accounts/keys-and-config';

# Get user account access control map
include 'common/core/accounts/access-control';

# Create the required groups
prefix '/software/components/accounts';
'groups' ?= dict();
'groups' = merge(SELF,
    dict('ssh', dict('gid', 2001)),
    dict('team', dict('gid', 2000)),
);

# Add the 'ssh' group to the list 'AllowGroups' in /etc/ssh/sshd_config
variable SSHD_ALLOW_GROUPS ?= list();
variable SSHD_ALLOW_GROUPS = append(SELF, 'ssh');

# Initialise a list of ordinary user accounts to create
variable ordinary_users = list();

# Merge list of research group principals with the list of ordinary user accounts
variable ordinary_users = if (is_defined('/system/owner_eon_id') && exists(HOST_USERACCESS_MAP[format('eon_id_%s', value('/system/owner_eon_id'))]['principals'])) {
    merge(SELF, HOST_USERACCESS_MAP[format('eon_id_%s', value('/system/owner_eon_id'))]['principals']);
}
else {
    SELF;
};

# Merge list of research group ordinary members with the list of ordinary user accounts
variable ordinary_users = if (is_defined('/system/owner_eon_id') && exists(HOST_USERACCESS_MAP[format('eon_id_%s', value('/system/owner_eon_id'))][FULL_HOSTNAME])) {
    merge(SELF, HOST_USERACCESS_MAP[format('eon_id_%s', value('/system/owner_eon_id'))][FULL_HOSTNAME]);
}
else {
    merge(SELF, HOST_USERACCESS_MAP[format('eon_id_%s', value('/system/owner_eon_id'))]['default_users']);
};

# Create a data structure of the private groups for the ordinary users
variable group_accounts = dict();
variable group_accounts = {
    groups = dict();
    foreach (i; v; ordinary_users) {
        groups = merge(groups, dict(v, dict('gid', ACCOUNT_CONFIG[v]['id'])));
    };
    groups;
};

# Create the private groups for the ordinary users
'groups' = merge(SELF, group_accounts);

# Create the required users
'users' ?= dict();

# Define a default shell
variable default_shell = '/bin/bash';

# Enable features to add additional group memberships to user accounts
# if the user is a member of the 'team' group (i.e. they are a real person)
variable EXTRA_GROUPS ?= list();

# Create a data structure of the user accounts for the ordinary users
variable user_accounts = dict();
variable user_accounts = {
    users = dict();
    foreach (i; v; ordinary_users) {
        users = merge(users, dict(v,
            dict(
                'uid', ACCOUNT_CONFIG[v]['id'],
                'groups', if (is_defined(ACCOUNT_CONFIG[v]['extra_groups']) && index('team', ACCOUNT_CONFIG[v]['extra_groups']) >= 0) {
                              merge(list(v), ACCOUNT_CONFIG[v]['extra_groups'], EXTRA_GROUPS)
                          }
                          else if (is_defined(ACCOUNT_CONFIG[v]['extra_groups']) && index('team', ACCOUNT_CONFIG[v]['extra_groups']) == -1) {
                              merge(list(v), ACCOUNT_CONFIG[v]['extra_groups'])
                          }
                          else {
                              list(v)
                          },
                'comment', ACCOUNT_CONFIG[v]['name'],
                'shell', if (is_defined(ACCOUNT_CONFIG[v]['shell'])) {
                             ACCOUNT_CONFIG[v]['shell']
                         }
                         else {
                             default_shell
                         },
                'homeDir', format('/home/%s', v),
                'createHome', true,
            )
        ));
    };
    users;
};

# Create the user accounts for the ordinary users
'users' = merge(SELF, user_accounts);

# Prepare to install ssh keys for ordinary user accounts
prefix '/software/components/useraccess';
'users' ?= dict();

# Create a data structure of the ssh keys for the ordinary user accounts
variable user_keys = dict();
variable user_keys = {
    keys = dict();
    foreach (i; v; ordinary_users) {
        key_list = list();
        foreach (idx; val; ACCOUNT_CONFIG[v]['keys']) {
            key_list = append(key_list, join(' ', ACCOUNT_CONFIG[v]['keys'][idx], ACCOUNT_CONFIG[v]['email']));
        };
        keys = merge(keys, dict(v, dict('ssh_keys', key_list)));
    };
    keys;
};

# Install the ssh keys for the ordinary user accounts
'users' = merge(SELF, user_keys);
