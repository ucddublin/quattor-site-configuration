unique template features/core/hardware/network/config;

# The solution here is messy, but it is required as include can only include
# one thing, it is a declaration, not a function. An issue has been opened on
# github about this: https://github.com/quattor/pan/issues/18

# What we have here allows us to configure at least eight network drivers and
# eight network cards that can be different from each other.

# Add any extra configuration for NIC drivers if required
include if (length(NETWORK_DRIVERS) > 0) {
    if_exists(format('features/core/hardware/network/drivers/%s', NETWORK_DRIVERS[0]));
};

include if (length(NETWORK_DRIVERS) > 1) {
    if_exists(format('features/core/hardware/network/drivers/%s', NETWORK_DRIVERS[1]));
};

include if (length(NETWORK_DRIVERS) > 2) {
    if_exists(format('features/core/hardware/network/drivers/%s', NETWORK_DRIVERS[2]));
};

include if (length(NETWORK_DRIVERS) > 3) {
    if_exists(format('features/core/hardware/network/drivers/%s', NETWORK_DRIVERS[3]));
};

include if (length(NETWORK_DRIVERS) > 4) {
    if_exists(format('features/core/hardware/network/drivers/%s', NETWORK_DRIVERS[4]));
};

include if (length(NETWORK_DRIVERS) > 5) {
    if_exists(format('features/core/hardware/network/drivers/%s', NETWORK_DRIVERS[5]));
};

include if (length(NETWORK_DRIVERS) > 6) {
    if_exists(format('features/core/hardware/network/drivers/%s', NETWORK_DRIVERS[6]));
};

include if (length(NETWORK_DRIVERS) > 7) {
    if_exists(format('features/core/hardware/network/drivers/%s', NETWORK_DRIVERS[7]));
};

variable number_of_network_drivers = if (length(NETWORK_DRIVERS) > 8) {
    error('You need to add extra "include if (length(NETWORK_DRIVERS) > x)" statements in the template "features/core/hardware/network/config" to handle more than 8 network interfaces.');
}
else {
    SELF;
};

# Add any extra configuration NIC cards if required
include if (length(NETWORK_CARDS) > 0) {
    if_exists(format('features/core/hardware/network/cards/%s', NETWORK_CARDS[0]));
};

include if (length(NETWORK_CARDS) > 1) {
    if_exists(format('features/core/hardware/network/cards/%s', NETWORK_CARDS[1]));
};

include if (length(NETWORK_CARDS) > 2) {
    if_exists(format('features/core/hardware/network/cards/%s', NETWORK_CARDS[2]));
};

include if (length(NETWORK_CARDS) > 3) {
    if_exists(format('features/core/hardware/network/cards/%s', NETWORK_CARDS[3]));
};

include if (length(NETWORK_CARDS) > 4) {
    if_exists(format('features/core/hardware/network/cards/%s', NETWORK_CARDS[4]));
};

include if (length(NETWORK_CARDS) > 5) {
    if_exists(format('features/core/hardware/network/cards/%s', NETWORK_CARDS[5]));
};

include if (length(NETWORK_CARDS) > 6) {
    if_exists(format('features/core/hardware/network/cards/%s', NETWORK_CARDS[6]));
};

include if (length(NETWORK_CARDS) > 7) {
    if_exists(format('features/core/hardware/network/cards/%s', NETWORK_CARDS[7]));
};

variable number_of_network_cards = if (length(NETWORK_CARDS) > 8) {
    error('You need to add extra "include if (length(NETWORK_CARDS) > x)" statements in the template "features/core/hardware/network/config" to handle more than 8 network interfaces.');
}
else {
    SELF;
};
