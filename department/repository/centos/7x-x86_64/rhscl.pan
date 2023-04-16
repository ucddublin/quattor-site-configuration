structure template repository/centos/7x-x86_64/rhscl;

'name' = 'centos-7x-x86_64-rhscl';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.example.net/pub/linux/CentOS/7/sclo/x86_64/rh/',
    ),
);

'priority' = 50;
