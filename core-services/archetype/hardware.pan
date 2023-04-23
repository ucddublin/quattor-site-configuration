unique template archetype/hardware;

# Discover key hardware components
final variable HARDWARE_MODEL = if (path_exists('/hardware/model') && is_defined(value('/hardware/model')) && path_exists('/hardware/manufacturer') && is_defined(value('/hardware/manufacturer'))) {
    join('-', value('/hardware/manufacturer'), value('/hardware/model'));
}
else {
    'default';
};

# Discover RAID card (if present)
final variable HW_RAID_CARDS = {
    card_list = list();
    if (path_exists('/hardware/cards/raid') && is_defined(value('/hardware/cards/raid'))) {
        foreach (k; v; value('/hardware/cards/raid')) {
            raid_manufacturer = format('/hardware/cards/raid/%s/manufacturer', k);
            raid_vendor = format('/hardware/cards/raid/%s/name', k);
            if (path_exists(raid_manufacturer) && !match(value(raid_manufacturer), ' ') && path_exists(raid_vendor) && !match(value(raid_vendor), ' ')) {
                card_list = append(card_list, to_lowercase(join('-', value(raid_manufacturer), value(raid_vendor))));
            };
        };
    };
    card_list;
};

# Discover network card drivers
final variable NETWORK_DRIVERS = {
    driver_list = list();
    foreach (k; v; value('/hardware/cards/nic')) {
        nic_driver = format('/hardware/cards/nic/%s/driver', k);
        if (path_exists(nic_driver) && !match(value(nic_driver), ' ')) {
            driver_list = append(driver_list, value(nic_driver));
        };
    };
    driver_list;
};

# Discover network card models
final variable NETWORK_CARDS = {
    card_list = list();
    foreach (k; v; value('/hardware/cards/nic')) {
        nic_model = format('/hardware/cards/nic/%s/model', k);
        if (path_exists(nic_model) && !match(value(nic_model), ' ')) {
            card_list = append(card_list, value(nic_model));
        };
    };
    card_list;
};

# Discover boot disks
variable boot_disks = {
    os_disks = list();
    if (path_exists('/hardware/harddisks')) {
        foreach (k; v; value('/hardware/harddisks')) {
            if (path_exists(format('/hardware/harddisks/%s/boot', k))) {
                os_disks = append(os_disks, k);
            };
        };
    };
    os_disks;
};

# Select the first disk in the list boot_disks as the BOOT_DISK and prevent it
# from being modified later. This allows hosts to have > 1 boot disk, e.g. if
# using software RAID 1
final variable BOOT_DISK = boot_disks[0];

# Discover GPU cards
final variable GPU_CARDS = {
    card_list = list();
    if (path_exists('/hardware/cards/gpu')) {
        foreach (i; v; value('/hardware/cards/gpu')) {
            if (is_defined(format('/hardware/cards/gpu/%d/manufacturer', i))) {
                card_list = append(card_list, value(format('/hardware/cards/gpu/%d/manufacturer', i)));
            };
        };
    };
    card_list;
};

# Define a global variable NVIDIA_GPU and assign to it the boolean value 'true'
# if an Nvidia GPU is fitted to the machine, else should be 'false'
final variable NVIDIA_GPU = {
    foreach (i; v; GPU_CARDS) {
        if (GPU_CARDS[i] == 'nvidia') {
            return(true);
        };
    };
    false;
};

# Map hardware models to their firmware types
variable model_firmware_type_map = dict(
    'default', 'uefi',
    'mystery-1u-2007-general', 'bios',
    'raspberry-pi-4b-2020-general', 'soc',
);

final variable FW_TYPE = if (is_defined(model_firmware_type_map[HARDWARE_MODEL])) {
    model_firmware_type_map[HARDWARE_MODEL];
}
else {
    model_firmware_type_map['default'];
};
