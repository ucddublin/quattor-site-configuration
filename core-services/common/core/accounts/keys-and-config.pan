unique template common/core/accounts/keys-and-config;

# Global lookup table for user account parameters
final variable ACCOUNT_CONFIG = dict(
    'kay', dict(
        'name', 'Kathleen Rita McNulty',
        'email', 'kay.mcnulty@example.net',
        'id', 1000,
        'extra_groups', list('ssh', 'team', 'wheel'),
        'keys', list('kayKEYKEYKEYKEY'),
    ),

    'john', dict(
        'name', 'John James Nolan',
        'email', 'john.nolan@example.net',
        'id', 1001,
        'extra_groups', list('ssh', 'team'),
        'keys', list('johnKEYKEYKEYKEY'),
    ),

    'patrick', dict(
        'name', 'Patrick Joseph Nolan',
        'email', 'patrick.nolan@example.net',
        'id', 1002,
        'extra_groups', list('ssh', 'team'),
        'keys', list('patrickKEYKEYKEYKEY'),
    ),

    'thomas', dict(
        'name', 'Thomas Edwin Nevin',
        'email', 'thomas.nevin@example.net',
        'id', 1003,
        'extra_groups', list('ssh', 'team'),
        'keys', list('thomasKEYKEYKEYKEY'),
    ),
);
