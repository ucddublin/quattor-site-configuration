structure template repository/centos/7x-x86_64/os;

'name' = 'centos-7x-x86_64-os';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.domain.tld/pub/linux/CentOS/7/os/x86_64/',
    ),
);

'priority' = 50;
