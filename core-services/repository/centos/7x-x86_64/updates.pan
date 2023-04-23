structure template repository/centos/7x-x86_64/updates;

'name' = 'centos-7x-x86_64-updates';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.example.net/pub/linux/CentOS/7/updates/x86_64/',
    ),
);

'priority' = 50;
