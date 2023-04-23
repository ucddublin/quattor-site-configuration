unique template features/web/apache/ssl;

include 'components/metaconfig/config';

# Install SSL module for Apache web server
'/software/packages' = pkg_repl('mod_ssl');

# Configure global Apache SSL/TLS settings with metaconfig
variable METACONFIG_HTTPD_VERSION = '2.4';

include 'metaconfig/httpd/schema';

bind '/software/components/metaconfig/services/{/etc/httpd/conf.d/ssl.conf}/contents' = httpd_vhosts;

prefix '/software/components/metaconfig/services/{/etc/httpd/conf.d/ssl.conf}';
'module' = format('httpd/%s/httpd_conf', METACONFIG_HTTPD_VERSION);
'daemons/httpd' = 'restart';
'contents' ?= dict();
'contents' = merge(SELF, dict(
    'ssl', dict(
        'passphrasedialog', 'exec:/usr/libexec/httpd-ssl-pass-dialog',
        'sessioncache', 'shmcb:/run/httpd/sslcache(512000)',
        'sessioncachetimeout', 300,
        'randomseed', list(list('startup', 'file:/dev/urandom', '256'), list('connect', 'builtin')),
        'cryptodevice', list('builtin'),
    ),
));
