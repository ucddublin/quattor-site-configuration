structure template repository/nvidia/el7-x86_64;

'name' = 'nvidia-el7-x86_64';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://domain.tld/compute/cuda/repos/rhel7/x86_64/',
    ),
);

'priority' = 50;
