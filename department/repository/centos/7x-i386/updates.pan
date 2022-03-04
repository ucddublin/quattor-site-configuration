structure template repository/centos/7x-i386/updates;

'name' = 'centos-7x-i386-updates';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.domain.tld/pub/linux/CentOS/7/updates/i386/',
    ),
);

'priority' = 50;
