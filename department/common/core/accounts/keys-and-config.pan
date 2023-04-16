unique template common/core/accounts/keys-and-config;

# Global lookup table for user account parameters
final variable ACCOUNT_CONFIG = dict(
    'james', dict(
        'name', 'James Joyce',
        'email', 'james.joyce@example.net',
        'id', 1000,
        'extra_groups', list('ssh', 'team', 'wheel'),
        'keys', list('KEYKEYKEYKEY'),
    ),

    'kate', dict(
        'name', 'Kate O’Brien',
        'email', 'kate.obrien@example.net',
        'id', 1001,
        'extra_groups', list('ssh', 'team'),
        'keys', list('KEYKEYKEYKEY'),
    ),

    'maeve', dict(
        'name', 'Maeve Binchy',
        'email', 'maeve.binchy@example.net',
        'id', 1002,
        'extra_groups', list('ssh', 'team'),
        'keys', list('KEYKEYKEYKEY'),
    ),

    'thomas', dict(
        'name', 'Thomas Edwin Nevin',
        'email', 'thomas.nevin@example.net',
        'id', 1003,
        'extra_groups', list('ssh', 'team'),
        'keys', list('KEYKEYKEYKEY'),
    ),

    'john', dict(
        'name', 'John James Nolan',
        'email', 'john.nolan@example.net',
        'id', 1004,
        'extra_groups', list('ssh', 'team'),
        'keys', list('KEYKEYKEYKEY'),
    ),

    'samuel', dict(
        'name', 'Samuel Beckett',
        'email', 'samuel.beckett@realm.tld',
        'id', 1005,
        'extra_groups', list('ssh'),
        'keys', list('KEYKEYKEYKEY'),
    ),
);
