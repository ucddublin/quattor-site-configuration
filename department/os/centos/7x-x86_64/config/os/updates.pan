template config/os/updates;

# Remove packages we do not want on the system
'/software/packages' = pkg_del('abrt-addon-ccpp');
'/software/packages' = pkg_del('abrt-addon-python');
'/software/packages' = pkg_del('abrt-cli');
'/software/packages' = pkg_del('abrt-console-notification');
'/software/packages' = pkg_del('bpftool');
'/software/packages' = pkg_del('chrony');
'/software/packages' = pkg_del('crda');
'/software/packages' = pkg_del('firewalld');
'/software/packages' = pkg_del('iprutils');
'/software/packages' = pkg_del('kmod-kvdo');
'/software/packages' = pkg_del('kpatch');
'/software/packages' = pkg_del('libreport-plugin-mailx');
'/software/packages' = pkg_del('libstoragemgmt');
'/software/packages' = pkg_del('mlocate');
'/software/packages' = pkg_del('sos');
'/software/packages' = pkg_del('sssd-client');
'/software/packages' = pkg_del('systemtap-runtime');
'/software/packages' = pkg_del('teamd');
'/software/packages' = pkg_del('usb_modeswitch');
'/software/packages' = pkg_del('vdo');
