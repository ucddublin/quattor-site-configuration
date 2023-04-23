unique template features/database/mariadb/config;

include 'components/systemd/config';

# Define Maria DB version
final variable mariadb_version = format('10.5.9-1.%s.%s', OS_PLATFORM, value('/system/os/distribution/name'));
final variable mariadb_major_version = join('.', splice(split('\.', mariadb_version), 2, 3));

# Add repository with up-to-date Maria DB packages
variable OS_REPOSITORY_LIST = append(SELF,
    format('mariadb/%s/%s-%s', mariadb_major_version, OS_PLATFORM, PKG_ARCH_DEFAULT)
);

# Install Maria DB
'/software/packages' = pkg_repl('MariaDB-client', mariadb_version, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('MariaDB-common', mariadb_version, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('MariaDB-server', mariadb_version, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('MariaDB-compat', mariadb_version, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('galera-4', format('26.4.7-1.%s.%s', OS_PLATFORM, value('/system/os/distribution/name')), PKG_ARCH_DEFAULT);

# Enable and start Maria DB
prefix '/software/components/systemd/unit/{mariadb.service}';
'name' = 'mariadb';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;
