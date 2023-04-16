structure template repository/quattor/release/noarch;

'name' = 'quattor-release';
'owner' = 'support@example.net';
'protocols' = list(
    dict(
        'name', 'http',
        'url', format('http://yum.quattor.org/%s/%s/', QUATTOR_RELEASE, OS_PLATFORM),
    ),
);

'priority' = 40;
