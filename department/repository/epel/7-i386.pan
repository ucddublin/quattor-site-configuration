structure template repository/epel/7-i386;

'name' = 'epel-7-i386';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.example.net/pub/linux/epel/7Server/i386/',
    ),
);

'priority' = 50;
