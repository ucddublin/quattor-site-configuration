structure template repository/quattor/release/noarch;

'name' = 'quattor-release';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'http',
        'url', format('http://yum.quattor.org/%s/%s/', QUATTOR_RELEASE, OS_PLATFORM),
    ),
);

'priority' = 40;
