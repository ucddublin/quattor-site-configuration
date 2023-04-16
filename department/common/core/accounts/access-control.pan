unique template common/core/accounts/access-control;

# Map hosts to users who should have access to them for each group
variable HOST_USERACCESS_MAP = dict(
    # /domain/sedf/new-host
    'eon_id_1', dict(
        'grn', '/domain/sedf/new-host',

        'default_users', list(),
    ),

    # /domain/sedf/cw
    'eon_id_2', dict(
        'grn', '/domain/sedf/cw',

        'principals', list(
            'james',
        ),

        'default_users', list(
            'kate', 'maeve',
        ),

        # root password for /domain/sedf/cw hosts
        'root_pw', 'PASSWDPASSWDPASSWDPASSWD',
    ),

    # /domain/sp/ap
    'eon_id_3', dict(
        'grn', '/domain/sp/ap',

        'default_users', list(
            'thomas', 'john',
        ),

        'calculator.example.net', list(
            'thomas', 'john', 'samuel',
        ),

        # root password for /domain/sp/ap hosts
        'root_pw', 'PASSWDPASSWDPASSWDPASSWD',
    ),

    # Default root password for all hosts if not defined above
    'defaults', dict(
        'root_pw', 'PASSWDPASSWDPASSWDPASSWD',
    ),
);
