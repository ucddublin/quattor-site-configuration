unique template repository/config/os;

include 'quattor/functions/repository';

# Ordered list of repositories to load
# NOTE: The repository which contains the AII rpms must be listed
# first in the list.  If not, then AII installations will fail
# because the post-install script will look in the wrong place.
variable OS_REPOSITORY_LIST = list(
    'quattor/release/noarch',
    'quattor/externals/el7-noarch',
    'centos/7x-i386/os',
    'centos/7x-i386/updates',
    'epel/7-i386',
);
