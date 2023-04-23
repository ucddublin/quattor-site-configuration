unique template common/core/accounts/access-control;

# Map hosts to users who should have access to them for each group
variable HOST_USERACCESS_MAP = dict(
    # /bud/core-services/new-host
    'eon_id_1', dict(
        'grn', '/bud/core-services/new-host',

        'default_users', list(),
    ),

    # /bud/core-services/core
    'eon_id_2', dict(
        'grn', '/bud/core-services/core',

        'principals', list(
            'john',
        ),

        'default_users', list(
            'patrick', 'thomas',
        ),

        # root password for /bud/core-services/core hosts
        'root_pw', 'corePASSWDPASSWDPASSWDPASSWD',
    ),

    # Default root password for all hosts if not defined above
    'defaults', dict(
        'root_pw', 'defaultPASSWDPASSWDPASSWDPASSWD',
    ),
);
