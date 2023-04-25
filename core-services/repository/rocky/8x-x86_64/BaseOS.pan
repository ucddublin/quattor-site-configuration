structure template repository/rocky/8x-x86_64/BaseOS;

'name' = 'rocky-8x-x86_64-BaseOS';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', format('http://mirror.in2p3.fr/pub/linux/rocky/8/BaseOS/x86_64/%s/', REPO_TYPE),
    ),
);

'priority' = 50;
