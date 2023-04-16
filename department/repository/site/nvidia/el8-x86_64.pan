structure template repository/site/nvidia/el8-x86_64;

'name' = 'site-nvidia-el8-x86_64';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://aquilon.example.net/repos/nvidia/x86_64/el8/',
    ),
);

'priority' = 40;
