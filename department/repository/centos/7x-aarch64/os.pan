structure template repository/centos/7x-aarch64/os;

'name' = 'centos-7x-aarch64-os';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.domain.tld/centos-altarch/7/os/aarch64/',
    ),
);

'priority' = 50;
