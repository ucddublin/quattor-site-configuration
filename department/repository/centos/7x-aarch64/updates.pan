structure template repository/centos/7x-aarch64/updates;

'name' = 'centos-7x-aarch64-updates';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.wd6.net/centos-altarch/7/updates/aarch64/',
    ),
);

'priority' = 50;
