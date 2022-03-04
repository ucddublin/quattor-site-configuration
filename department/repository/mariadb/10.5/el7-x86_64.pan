structure template repository/mariadb/10.5/el7-x86_64;

'name' = 'mariadb-10.5-el7-x86_64';
'owner' = 'support@domain.tld';
'protocols' = list(
    dict(
        'name', 'https',
        'url', 'https://domain.tld/MariaDB/mariadb-10.5.9/yum/centos7-amd64/',
    ),
);

'priority' = 40;
