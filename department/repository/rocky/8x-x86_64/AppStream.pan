structure template repository/rocky/8x-x86_64/AppStream;

'name' = 'rocky-8x-x86_64-AppStream';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', format('http://mirror.example.net/pub/linux/rocky/8/AppStream/x86_64/%s/', REPO_TYPE),
    ),
);

'priority' = 50;
