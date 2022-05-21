structure template repository/site/nvidia/el7-x86_64;

'name' = 'site-nvidia-el7-x86_64';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://aquilon.domain.tld/repos/nvidia/x86_64/el7/',
    ),
);

'priority' = 40;
