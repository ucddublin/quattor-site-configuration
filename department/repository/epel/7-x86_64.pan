structure template repository/epel/7-x86_64;

'name' = 'epel-7-x86_64';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.domain.tld/pub/linux/epel/7Server/x86_64/',
    ),
);

'priority' = 50;
