template config/os/updates;

# Remove packages we do not want on the system
'/software/packages' = pkg_del('bpftool');
'/software/packages' = pkg_del('cockpit');
'/software/packages' = pkg_del('firewalld');
'/software/packages' = pkg_del('iprutils');
'/software/packages' = pkg_del('kmod-kvdo');
'/software/packages' = pkg_del('kpatch');
'/software/packages' = pkg_del('libstoragemgmt');
'/software/packages' = pkg_del('mlocate');
'/software/packages' = pkg_del('sos');
'/software/packages' = pkg_del('teamd');
'/software/packages' = pkg_del('vdo');
