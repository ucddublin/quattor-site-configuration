structure template repository/epel/7-aarch64;

'name' = 'epel-7-aarch64';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.domain.tld/epel/7Server/aarch64/',
    ),
);

'priority' = 50;
