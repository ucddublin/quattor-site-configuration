unique template repository/config/os;

include 'quattor/functions/repository';

# Ordered list of repositories to load
# NOTE: The repository which contains the AII rpms must be listed
# first in the list.  If not, then AII installations will fail
# because the post-install script will look in the wrong place.
variable OS_REPOSITORY_LIST = list(
    'quattor/release/noarch',
    'quattor/externals/el8-noarch',
    'site/perl/el8-noarch',
    'rocky/8x-x86_64/AppStream',
    'rocky/8x-x86_64/BaseOS',
    'rocky/8x-x86_64/PowerTools',
    'epel/8-x86_64',
);
