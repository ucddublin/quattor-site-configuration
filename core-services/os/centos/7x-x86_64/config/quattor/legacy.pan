template config/quattor/legacy;

# Define OS_VERSION_PARAMS for code in 'quattor/client/os_hacks' (in TL core) to work
variable OS_VERSION_PARAMS ?= dict(
    'distribution', value('/system/os/distribution/family'),
    'major',        value('/system/os/distribution/family') + to_string(value('/system/os/version/major')),
    'majorversion', to_string(value('/system/os/version/major')),
    'minor',        'x',
    'flavour',      'x',
    'version',      value('/system/os/distribution/family') + value('/system/os/version/name'),
    'arch',         value('/system/os/architecture'),
);
