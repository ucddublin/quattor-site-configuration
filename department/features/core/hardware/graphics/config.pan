unique template features/core/hardware/graphics/config;

# The solution here is messy, but it is required as include can only include
# one thing, it is a declaration, not a function. An issue has been opened on
# github about this: https://github.com/quattor/pan/issues/18

# What we have here allows us to install drivers for at least four GPU cards
# that can be different from each other.

# Install GPU drivers if required
include if (length(GPU_CARDS) > 0) {
    if_exists(format('features/core/hardware/graphics/cards/%s', GPU_CARDS[0]));
};

include if (length(GPU_CARDS) > 1) {
    if_exists(format('features/core/hardware/graphics/cards/%s', GPU_CARDS[1]));
};

include if (length(GPU_CARDS) > 2) {
    if_exists(format('features/core/hardware/graphics/cards/%s', GPU_CARDS[2]));
};

include if (length(GPU_CARDS) > 3) {
    if_exists(format('features/core/hardware/graphics/cards/%s', GPU_CARDS[3]));
};

variable number_of_graphics_cards = if (length(GPU_CARDS) > 4) {
    error("You need to add extra 'include if (length(GPU_CARDS) > x)' statements in the template 'features/core/hardware/graphics/config' to handle more than 4 graphics cards.");
}
else {
    SELF;
};
