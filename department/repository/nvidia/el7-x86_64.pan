structure template repository/nvidia/el7-x86_64;

'name' = 'nvidia-el7-x86_64';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://example.net/compute/cuda/repos/rhel7/x86_64/',
    ),
);

'priority' = 50;
