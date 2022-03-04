unique template common/development/gcc;

# Install Kernel and GLibC devel and header packages
'/software/packages' = pkg_repl('kernel-devel');
'/software/packages' = pkg_repl('kernel-headers');
'/software/packages' = pkg_repl('glibc-devel');
'/software/packages' = pkg_repl('glibc-headers');

# Add 32 bit GLibC and devel packages as sometimes they are needed
'/software/packages' = if (value('/system/os/architecture') == 'x86_64') {
    merge(SELF, dict(
        '{glibc.i686}', dict(),
        '{glibc-devel.i686}', dict(),
    ));
}
else {
    SELF;
};

# Install compilation utilities
'/software/packages' = pkg_repl('make');
'/software/packages' = pkg_repl('automake');
'/software/packages' = pkg_repl('autoconf');
'/software/packages' = {
    if (value('/system/os/version/major') <= 7) {
        pkg_repl('cmake3');
    }
    else {
        pkg_repl('cmake');
    };
};

# Install GCC C, C++ and Fortran compilers and libraries
'/software/packages' = pkg_repl('gcc');
'/software/packages' = pkg_repl('gcc-c++');
'/software/packages' = pkg_repl('libgcc');
'/software/packages' = pkg_repl('gcc-gfortran');
'/software/packages' = pkg_repl('libgfortran');

# Add 32 bit libgcc package as sometimes it is needed
'/software/packages' = if (value('/system/os/architecture') == 'x86_64') {
    merge(SELF, dict('{libgcc.i686}', dict()));
}
else {
    SELF;
};

# Add 32 bit libgfortran package as sometimes it is needed
'/software/packages' = if (value('/system/os/architecture') == 'x86_64') {
    merge(SELF, dict('{libgfortran.i686}', dict()));
}
else {
    SELF;
};

# Install RPM building tools
'/software/packages' = pkg_repl('rpmdevtools');
'/software/packages' = pkg_repl('rpmlint');

# Install version control system
'/software/packages' = pkg_repl('git');

# Install SystemD devel package
'/software/packages' = pkg_repl('systemd-devel');

# For preparation of documentation
'/software/packages' = pkg_repl('doxygen');
'/software/packages' = pkg_repl('graphviz');

# Define GCC versions
include 'common/versions/gcc';
final variable STD_GCC_VERSION = GCC_VERSION_OS_MAP[value('/system/os/version/name')]['default'];
final variable GCC8_VERSION = GCC_VERSION_OS_MAP[value('/system/os/version/name')]['gcc8'];
final variable GCC9_VERSION = GCC_VERSION_OS_MAP[value('/system/os/version/name')]['gcc9'];

# Install devtoolset-8 for GCC 8.3.1 and devtoolset-9 for GCC 9.1.1 on EL7 as
# GCC 4.8.5 (standard) is ancient, so cannot optimise for modern processors
include if_exists(format('common/development/gcc/payload-el%s', value('/system/os/version/major')));
