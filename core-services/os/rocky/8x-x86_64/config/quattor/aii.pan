template config/quattor/aii;

final variable AII_OSINSTALL_OPTION_LANG_SUPP = list('none');
final variable AII_OSINSTALL_OPTION_ZEROMBR_ARGS = list('');
final variable AII_OSINSTALL_NEEDS_SECTION_END = true;
final variable AII_OSINSTALL_OS_VERSION = '8.5';
final variable AII_OSINSTALL_SUBURL = format('/BaseOS/%s/kickstart', value('/system/os/architecture'));
final variable AII_NBP_LABEL = format('%s %s', value('/system/os/distribution/description'), AII_OSINSTALL_OS_VERSION);
final variable AII_NBP_ROOT = format('/images/pxeboot/%s/%s/%s', value('/system/os/distribution/name'), AII_OSINSTALL_OS_VERSION, value('/system/os/architecture'));

# Crucial since all network devices are under NM control (eg bnx2x 10g needs it)
'/system/aii/osinstall/ks/packages' = append(SELF, 'NetworkManager');
