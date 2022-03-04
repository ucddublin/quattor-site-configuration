structure template repository/epel/8-x86_64;

'name' = 'epel-8-x86_64';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.domain.tld/pub/linux/epel/8/Everything/x86_64/',
    ),
);

'priority' = 50;
