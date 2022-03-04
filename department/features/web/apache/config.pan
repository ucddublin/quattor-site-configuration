unique template features/web/apache/config;

include 'components/metaconfig/config';
include 'components/systemd/config';

# TODO: Configure log rotation

# Install Apache web server
'/software/packages' = pkg_repl('httpd');

# Enable and start Apache
prefix '/software/components/systemd/unit/{httpd.service}';
'name' = 'httpd';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;

# Configure global Apache settings with metaconfig
variable METACONFIG_HTTPD_VERSION = '2.4';

include 'metaconfig/httpd/httpd_conf';

prefix '/software/components/metaconfig/services/{/etc/httpd/conf/httpd.conf}';
'contents' ?= dict();
'contents' = merge(SELF, dict(
    'directories', list(
        dict(
            'name', '/',
            'access', dict('allowoverride', list('None')),
            'authz', list(dict('all', 'denied')),
        ),

        dict(
            'name', '"/var/www"',
            'access', dict('allowoverride', list('None')),
            'authz', list(dict('all', 'granted')),
        ),

        dict(
            'name', '"/var/www/html"',
            'options', list('Indexes', 'FollowSymLinks'),
            'access', dict('allowoverride', list('None')),
            'authz', list(dict('all', 'granted')),
        ),

        dict(
            'name', '"/var/www/cgi-bin"',
            'options', list('None'),
            'access', dict('allowoverride', list('None')),
            'authz', list(dict('all', 'granted')),
        ),
    ),

    'files', list(
        dict(
            'name', '".ht*"',
            'authz', list(dict('all', 'denied')),
        ),
    ),

    'global', dict(
        'documentroot', '"/var/www/html"',
        'enablemmap', false,
        'traceenable', 'off',
    ),

    'ifmodules', list(
        dict(
            'name', 'alias_module',
            'aliases', list(
                dict(
                    'type', 'script',
                    'url', '/cgi-bin/',
                    'destination', '"/var/www/cgi-bin/"'
                )
            ),
        ),

        dict(
            'name', 'dir_module',
            'directoryindex', list('index.html', 'index.php'),
        ),

        dict(
            'name', 'mime_module',
            'type', dict(
                'config', '/etc/mime.types',
                'add', list(
                    dict(
                        'name', 'application/x-compress',
                        'target', list('.Z'),
                    ),

                    dict(
                        'name', 'application/x-gzip',
                        'target', list('.gz' ,'.tgz'),
                    ),

                    dict(
                        'name', 'text/html',
                        'target', list('.shtml'),
                    ),
                ),
            ),
            'outputfilter', dict(
                 'add', list(
                    dict(
                        'name', 'INCLUDES',
                        'target', list('.shtml'),
                    ),
                ),
            ),
        ),

        dict(
            'name', 'mime_magic_module',
            'mimemagicfile', 'conf/magic',
        ),

        dict(
            'name', 'log_config_module',
            'log', dict(
                'format', list(
                    dict(
                        'name', 'combined',
                        'expr', '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"',
                    ),

                    dict(
                        'name', 'common',
                        'expr', '%h %l %u %t \"%r\" %>s %b',
                    )
                ),
                'custom', list(
                    dict(
                        'name', 'combined',
                        'location', '"logs/access_log"',
                    ),
                ),
            ),
        ),

        dict(
            'name', 'logio_module',
            'log', dict(
                'format', list(
                    dict(
                        'name', 'combinedio',
                        'expr', '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O',
                    ),
                ),
            ),
        ),
    ),

    'includes', list('conf.modules.d/*.conf'),

    'includesoptional', list('conf.d/*.conf'),

    'log', dict(
        'error', '"logs/error_log"',
        'level', 'warn',
    ),
));

# Configure Apache to use SSL/TLS
include 'features/web/apache/ssl';

# Configure Apache vhosts
include 'features/web/apache/vhost';

# Add server-specific configuration if present
include if_exists(format('features/web/apache/%s', HOSTNAME));
