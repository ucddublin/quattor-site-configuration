structure template repository/nvidia/el8-x86_64;

'name' = 'nvidia-el8-x86_64';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://domain.tld/compute/cuda/repos/rhel8/x86_64/',
    ),
);

'priority' = 50;
