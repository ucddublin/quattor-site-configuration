structure template repository/site/nvidia/el8-x86_64;

'name' = 'site-nvidia-el8-x86_64';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://aquilon.domain.tld/repos/nvidia/x86_64/el8/',
    ),
);

'priority' = 40;
