structure template repository/centos/7x-aarch64/kernel/rpi2;

'name' = 'centos-7x-aarch64-kernel-rpi2';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.wd6.net/centos-altarch/7/kernel/aarch64/kernel-rpi2/',
    ),
);

'priority' = 30;
