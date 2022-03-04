unique template features/storage/shared/config;

include 'components/dirperm/config';

# Create a shared directory under '/home'
'/software/components/dirperm/paths' ?= list();
'/software/components/dirperm/paths' = merge(SELF, list(
    dict(
        'path', '/home/shared_directory',
        'owner', 'root:team',
        'perm', '3770',
        'type', 'd',
        ),
));
