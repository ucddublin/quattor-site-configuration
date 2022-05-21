unique template features/core/cron/config;

include 'components/filecopy/config';

# Change main crontab to run each part at a defined time of our choosing
'/software/components/filecopy/services/{/etc/crontab}' = dict(
    'config', file_contents('features/core/cron/files/crontab'),
    'owner', 'root:root',
    'perms', '0644',
    'backup', false,
    'restart', '/usr/bin/systemctl reload crond.service',
);

# Replace /etc/cron.d/0hourly and /etc/cron.hourly/0anacron with empty files
# to prevent cronie and anacron running scheduled tasks twice between them
variable disabled_cron_file = dict(
    'config', "# Disabled to prevent double runs of scheduled tasks - see 'features/core/cron'\n",
    'owner', 'root:root',
    'backup', false,
);

prefix '/software/components/filecopy/services';
'{/etc/cron.d/0hourly}' = merge(disabled_cron_file, dict('perms', '0644'));
'{/etc/cron.hourly/0anacron}' = merge(disabled_cron_file, dict('perms', '0755'));
