unique template features/core/hardware/storage/config;

# The solution here is messy, but it is required as include can only include
# one thing, it is a declaration, not a function. An issue has been opened on
# github about this: https://github.com/quattor/pan/issues/18

# What we have here allows us to configure at least two raid cards that can be
# different from each other.

# Install CLI tools for configuring hardware RAID controllers if required
include if (length(HW_RAID_CARDS) > 0) {
    if_exists(format('features/core/hardware/storage/cards/%s', HW_RAID_CARDS[0]));
};

include if (length(HW_RAID_CARDS) > 1) {
    if_exists(format('features/core/hardware/storage/cards/%s', HW_RAID_CARDS[1]));
};

variable number_of_raid_cards = if (length(HW_RAID_CARDS) > 2) {
    error("You need to add extra 'include if (length(HW_RAID_CARDS) > x)' statements in the template 'features/core/hardware/storage/config' to handle more than 2 raid cards.");
}
else {
    SELF;
};
