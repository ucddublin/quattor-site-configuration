unique template common/development/gcc/payload-el7;

include 'components/symlink/config';

# Add Red Hat Software Collections repository for CentOS
variable OS_REPOSITORY_LIST = append(SELF,
    format(
        '%s/%sx-%s/rhscl',
        value('/system/os/distribution/name'),
        value('/system/os/version/major'),
        value('/system/os/architecture')
    )
);

# Install Software Collection utilities
'/software/packages' = pkg_repl('scl-utils');

# Install devtoolset-8, which provides GCC 8.3.1-3, which has more CPU
# optimisations than GCC 4.8.5-39
'/software/packages' = pkg_repl('devtoolset-8');

# Create missing symlink of f95 -> gfortran
'/software/components/symlink/links' ?= list();
'/software/components/symlink/links' = append(SELF, dict(
    'name', '/opt/rh/devtoolset-8/root/usr/bin/f95',
    'target', '/opt/rh/devtoolset-8/root/usr/bin/gfortran',
    'exists', true,
));

# Install devtoolset-9, which provides GCC 9.1.1-2, which offers target/tuning
# support for Intel 'cascade lake' CPUs
'/software/packages' = pkg_repl('devtoolset-9');

# Create missing symlink of f95 -> gfortran
'/software/components/symlink/links' = append(SELF, dict(
    'name', '/opt/rh/devtoolset-9/root/usr/bin/f95',
    'target', '/opt/rh/devtoolset-9/root/usr/bin/gfortran',
    'exists', true,
));

# Add up-to-date libgfortran5 (pulled in by devtoolset-{8,9} anyway)
'/software/packages' = pkg_repl('libgfortran5');

# Add 32 bit libgfortran5 package as sometimes it is needed
'/software/packages' = if (value('/system/os/architecture') == 'x86_64') {
    merge(SELF, dict('{libgfortran5.i686}', dict()));
}
else {
    SELF;
};
