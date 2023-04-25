structure template repository/centos/7x-aarch64/kernel/generic;

'name' = 'centos-7x-aarch64-kernel-generic';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://mirror.wd6.net/centos-altarch/7/kernel/aarch64/kernel-generic/',
    ),
);

'priority' = 30;
