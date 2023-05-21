structure template repository/rocky/8x-aarch64/PowerTools;

'name' = 'rocky-8x-aarch64-PowerTools';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', format('http://mirror.in2p3.fr/pub/linux/rocky/8/PowerTools/aarch64/%s/', REPO_TYPE),
    ),
);

'priority' = 50;
