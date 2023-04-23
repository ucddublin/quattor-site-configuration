structure template repository/nvidia/el8-x86_64;

'name' = 'nvidia-el8-x86_64';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://example.net/compute/cuda/repos/rhel8/x86_64/',
    ),
);

'priority' = 50;
