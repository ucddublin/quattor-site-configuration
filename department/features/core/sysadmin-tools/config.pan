unique template features/core/sysadmin-tools/config;

include 'components/systemd/config';

'/software/packages' = {
    # Disk drive utilities
    pkg_repl('hdparm');
    pkg_repl('sdparm');

    # Authenticate remote X11 forwarding (over SSH) and provide apps
    # for debugging
    pkg_repl('xorg-x11-xauth');
    pkg_repl('xorg-x11-apps');

    # Monitoring and reporting
    pkg_repl('atop');
    pkg_repl('htop');
    pkg_repl('iftop');
    pkg_repl('iotop');
    pkg_repl('powertop');

    # DMI table decoder
    pkg_repl('dmidecode');

    # EDAC utilities for detection of EEC errors in RAM
    pkg_repl('edac-utils');

    # Utilities for interfacing with sysfs
    pkg_repl('sysfsutils');

    # For preparation of documentation
    pkg_repl('groff');

    # IPMI tool
    pkg_repl('ipmitool');

    # LM sensors
    pkg_repl('lm_sensors');

    # Network utilities
    pkg_repl('nmap');

    # Domain information
    pkg_repl('whois');
    
    # JSON data querying tool
    pkg_repl('jq');

    # Unix tool collection
    pkg_repl('moreutils');

    # Patch management and code review
    pkg_repl('patch');
    pkg_repl('colordiff');

    # Terminal window manager
    pkg_repl('screen');

    # Timezone data
    pkg_repl('tzdata');

    # TCL tool command language
    pkg_repl('tcl');
    pkg_repl('tcllib');
};

# Handle change of package name for dstat on going from EL7 to EL8, was under
# monitoring and reporting
'/software/packages' = {
    if (value('/system/os/version/major') <= 7) {
        pkg_repl('dstat');
    }
    else {
        pkg_repl('pcp-system-tools');
    };
};

# Enable edac service
prefix '/software/components/systemd/unit/{edac.service}';
'name' = 'edac';
'type' = 'service';
'state' = 'enabled';
'startstop' = true;
