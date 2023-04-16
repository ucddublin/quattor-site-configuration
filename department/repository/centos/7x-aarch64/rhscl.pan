structure template repository/centos/7x-aarch64/rhscl;

'name' = 'centos-7x-aarch64-rhscl';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.wd6.net/centos-altarch/7/sclo/aarch64/rh/',
    ),
);

'priority' = 50;
