structure template repository/site/apps/el7-x86_64;

'name' = 'site-apps-el7-x86_64';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', 'http://aquilon.domain.tld/repos/apps/x86_64/el7/',
    ),
);

'priority' = 40;
