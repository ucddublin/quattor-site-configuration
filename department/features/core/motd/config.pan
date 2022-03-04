unique template features/core/motd/config;

include 'components/filecopy/config';

variable MOTD_NODE_INFO ?= "";

variable motd_branch = format(
    '%s (%s)',
    value('/metadata/template/branch/name'),
    value('/metadata/template/branch/type'),
);

variable motd_branch = if (path_exists('/metadata/template/branch/author')) {
    format('%s/%s', value('/metadata/template/branch/author'), SELF);
}
else {
    SELF;
};

variable rack = if (path_exists('/hardware/rack/name')) {
    format('rack%s', substr(value('/hardware/rack/name'), length(value('/hardware/sysloc/building'))));
}
else {
    'desk';
};

variable motd = format(
    file_contents('features/core/motd/files/template.txt'),
    file_contents('features/core/motd/files/aquilon.txt'),
    value('/system/network/hostname'),
    value('/hardware/location'),
    value('/hardware/sysloc/room'),
    rack,
    motd_branch,
    value('/system/archetype/name'),
    PERSONALITY,
    NODE_OS_VERSION,
    '', # To be replaced by 'SNAPSHOT' once implemented
    MOTD_NODE_INFO,
);

prefix '/software/components/filecopy/services/{/etc/motd}';
'config' = motd;
'owner' = 'root:root';
'perms' = '0644';
