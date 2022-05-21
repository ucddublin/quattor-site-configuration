unique template features/core/logrotate/config;

include 'components/altlogrotate/config';

'/software/components/altlogrotate/entries/global' = dict(
    'global', true,
    'frequency', 'weekly',
    'rotate', 4,
    'create', true,
    'compress', true,
    'include', '/etc/logrotate.d',
);

'/software/components/altlogrotate/entries/btmp' = dict(
    'global', true,
    'ifempty', false,
    'pattern', '/var/log/btmp',
    'missingok', true,
    'frequency', 'monthly',
    'rotate', 1,
    'create', true,
    'createparams', dict(
        'mode', '0600',
        'owner', 'root',
        'group', 'utmp',
    ),
);

'/software/components/altlogrotate/entries/wtmp' = dict(
    'global', true,
    'pattern', '/var/log/wtmp',
    'frequency', 'monthly',
    'rotate', 1,
    'create', true,
    'createparams', dict(
        'mode', '0664',
        'owner', 'root',
        'group', 'utmp',
    ),
);
