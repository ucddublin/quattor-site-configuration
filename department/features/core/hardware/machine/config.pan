unique template features/core/hardware/machine/config;

# Include any model-specific configuration
include if_exists(format('features/core/hardware/machine/model/%s', HARDWARE_MODEL));
