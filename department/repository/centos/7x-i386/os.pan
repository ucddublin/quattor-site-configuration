structure template repository/centos/7x-i386/os;

'name' = 'centos-7x-i386-os';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.example.net/pub/linux/CentOS/7/os/i386/',
    ),
);

'priority' = 50;
