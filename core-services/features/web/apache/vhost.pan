unique template features/web/apache/vhost;

include 'components/dirperm/config';
include 'components/metaconfig/config';

# TODO: Configure log rotation

# Configure Apache with metaconfig
variable METACONFIG_HTTPD_VERSION = '2.4';

include 'metaconfig/httpd/schema';

bind '/software/components/metaconfig/services/{/etc/httpd/conf.d/vhost.conf}/contents' = httpd_vhosts;

prefix '/software/components/metaconfig/services/{/etc/httpd/conf.d/vhost.conf}';
'module' = format('httpd/%s/generic_server', METACONFIG_HTTPD_VERSION);
'daemons/httpd' = 'restart';
'contents' ?= dict();
'contents' = merge(SELF, dict(
    'listen', list(
        dict(
            'port', 80,
            'name', '*',
            'protocol', 'http',
        ),

        dict(
            'port', 443,
            'name', to_string(PRIMARY_IP),
            'protocol', 'https',
        ),
    ),

    'vhosts', dict(
        'https',
            dict(
                'servername', FULL_HOSTNAME,
                'port', 443,
                'ip', list(PRIMARY_IP),
                'documentroot', format('/var/www/html/%s', HOSTNAME),
                'ssl', dict(
                    'certificatefile', format('/etc/pki/tls/certs/%s/hostcert.pem', HOSTNAME),
                    'certificatekeyfile', format('/etc/pki/tls/private/%s/hostkey.pem', HOSTNAME),
                    'certificatechainfile', '/etc/pki/tls/certs/ca-chain.cert.pem',
                    'protocol',  list('TLSv1.2'),
                    'ciphersuite', list('TLSv1'),
                    'honorcipherorder', 'on',
                    'engine', true,
                ),

                'log', dict(
                    'error', 'logs/ssl_error_log',
                    'transfer', 'logs/ssl_access_log',
                    'level', 'warn',
                    'custom', list(
                        dict(
                            'location', 'logs/ssl_request_log',
                            'name', '"%t %h %{SSL_PROTOCOL}x %{SSL_CIPHER}x \"%r\" %b"',
                        ),
                    ),
                ),

                'files', list(
                    dict(
                        'name', '\.(cgi|shtml|phtml|php3?)$',
                        'regex', true,
                        'ssl', dict(
                            'options', list('+StdEnvVars'),
                        ),
                    ),
                ),

                'directories', list(
                    dict(
                        'name', format('"/var/www/html/%s"', HOSTNAME),
                        'options', list('None'),
                    ),

                    dict(
                        'name', '"/var/www/cgi-bin"',
                        'ssl', dict(
                            'options', list('+StdEnvVars'),
                        ),
                    ),
                ),

                'browsermatch', list(
                    dict(
                        'match', 'MSIE [2-5]',
                        'names', list(
                            'nokeepalive', 'ssl-unclean-shutdown', 'downgrade-1.0', 'force-response-1.0'
                        ),
                    ),
                ),

                'rewrite', dict(
                    'engine', true,
                    'rules', list(
                        dict(
                            'conditions', list(
                                dict(
                                    'test', '%{THE_REQUEST}',
                                    'pattern', 'HTTP/1\.0$',
                                ),
                            ),
                             'regexp', '.?',
                             'destination', '-',
                             'flags', list('F'),
                        ),
                    ),
                ),

                'header', list(
                    dict(
                        'name', 'Set-Cookie',
                        'action', 'edit',
                        'value', '^(.*)$ $1;HttpOnly;Secure',
                        'quotes', '',
                    ),

                    dict(
                        'name', 'X-Frame-Options',
                        'action', 'append',
                        'value', 'sameorigin',
                    ),

                    dict(
                        'name', 'X-XSS-Protection',
                        'action', 'set',
                        'value', '1; mode=block',
                    ),
                ),
            ),

        'http',
            dict(
                'servername', FULL_HOSTNAME,
                'port', 80,
                'ip', list('*'),
                'redirect', list(
                    dict(
                        'path', '/',
                        'status', 301,
                        'url', format('https://%s/', FULL_HOSTNAME),
                    ),
                ),
            ),
    ),
));

# Install X509 certificate for vhost
'/software/components/dirperm/paths' ?= list();
'/software/components/dirperm/paths' = merge(SELF, list(
    dict(
        'path', '/etc/pki/tls/certs/ca-chain.cert.pem',
        'owner', 'root:root',
        'perm', '0444',
        'type', 'f',
    ),

    dict(
        'path', format('/etc/pki/tls/certs/%s', HOSTNAME),
        'owner', 'root:root',
        'perm', '0755',
        'type', 'd',
    ),

    dict(
        'path', format('/etc/pki/tls/certs/%s/hostcert.pem', HOSTNAME),
        'owner', 'root:root',
        'perm', '0444',
        'type', 'f',
    ),

    dict(
        'path', format('/etc/pki/tls/private/%s', HOSTNAME),
        'owner', 'root:root',
        'perm', '0755',
        'type', 'd',
    ),

    dict(
        'path', format('/etc/pki/tls/private/%s/hostkey.pem', HOSTNAME),
        'owner', 'root:root',
        'perm', '0400',
        'type', 'f',
    ),
));

# Create html document root directory for vhost
'/software/components/dirperm/paths' = merge(SELF, list(
    dict(
        'path', format('/var/www/html/%s', HOSTNAME),
        'owner', 'root:root',
        'perm', '0755',
        'type', 'd',
    ),
));

# Make sure dirperm runs before metaconfig so the directory exists before httpd
# is restarted
'/software/components/metaconfig/dependencies/pre' ?= list();
'/software/components/metaconfig/dependencies/pre' = append(SELF, 'dirperm');
