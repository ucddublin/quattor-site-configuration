structure template repository/centos/7x-aarch64/os;

'name' = 'centos-7x-aarch64-os';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.example.net/centos-altarch/7/os/aarch64/',
    ),
);

'priority' = 50;
