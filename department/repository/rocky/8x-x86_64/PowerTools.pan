structure template repository/rocky/8x-x86_64/PowerTools;

'name' = 'rocky-8x-x86_64-PowerTools';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', format('http://mirror.example.net/pub/linux/rocky/8/PowerTools/x86_64/%s/', REPO_TYPE),
    ),
);

'priority' = 50;
