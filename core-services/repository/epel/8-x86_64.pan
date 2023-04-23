structure template repository/epel/8-x86_64;

'name' = 'epel-8-x86_64';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.example.net/pub/linux/epel/8/Everything/x86_64/',
    ),
);

'priority' = 50;
