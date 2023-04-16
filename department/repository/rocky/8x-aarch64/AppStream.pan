structure template repository/rocky/8x-aarch64/AppStream;

'name' = 'rocky-8x-aarch64-AppStream';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', format('http://mirror.example.net/pub/linux/rocky/8/AppStream/aarch64/%s/', REPO_TYPE),
    ),
);

'priority' = 50;
