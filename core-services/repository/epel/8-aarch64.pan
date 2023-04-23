structure template repository/epel/8-aarch64;

'name' = 'epel-8-aarch64';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.example.net/pub/linux/epel/8/Everything/aarch64/',
    ),
);

'priority' = 50;
