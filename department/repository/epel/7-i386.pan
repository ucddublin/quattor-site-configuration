structure template repository/epel/7-i386;

'name' = 'epel-7-i386';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.domain.tld/pub/linux/epel/7Server/i386/',
    ),
);

'priority' = 50;
