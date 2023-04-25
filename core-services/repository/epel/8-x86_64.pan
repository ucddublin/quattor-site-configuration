structure template repository/epel/8-x86_64;

'name' = 'epel-8-x86_64';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.in2p3.fr/pub/epel/8/Everything/x86_64/',
    ),
);

'priority' = 50;
