structure template repository/rocky/8x-aarch64/PowerTools;

'name' = 'rocky-8x-aarch64-PowerTools';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', format('http://mirror.domain.tld/pub/linux/rocky/8/PowerTools/aarch64/%s/', REPO_TYPE),
    ),
);

'priority' = 50;
