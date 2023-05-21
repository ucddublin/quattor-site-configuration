structure template repository/epel/7-aarch64;

'name' = 'epel-7-aarch64';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.wd6.net/epel/7Server/aarch64/',
    ),
);

'priority' = 50;
