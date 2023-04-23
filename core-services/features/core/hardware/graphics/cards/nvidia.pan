unique template features/core/hardware/graphics/cards/nvidia;

# Include GCC so DKMS can build the nvidia kernel object
include 'common/development/gcc';

# Prepare to add to the AII_OSINSTALL_PACKAGES package list
variable KS_INSTALL_PACKAGES ?= list();

# Install dkms during kickstart and add to the main package payload so the
# Nvidia driver RPMs can rebuild the Nvidia kernel objects after a kernel update
variable KS_INSTALL_PACKAGES = append(SELF, 'dkms');
'/software/packages' = pkg_repl('dkms');

# Remove packages associated with the open-source Nvidia 'nouveau' driver
variable KS_INSTALL_PACKAGES = merge(SELF, list('-xorg-x11-drivers', '-xorg-x11-drv-nouveau'));
'/software/packages' = pkg_del('xorg-x11-drivers');
'/software/packages' = pkg_del('xorg-x11-drv-nouveau');

# Define Nvidia software versions and configure software repositories
include 'common/versions/nvidia';

# Install Nvidia driver
include format('features/core/hardware/graphics/cards/nvidia/payload-el%s', value('/system/os/version/major'));

# Install 'nvtop' for monitoring processes that use GPU resources
'/software/packages' = pkg_repl('nvtop', format('2.0.0-1.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);

# Install 'ncurses-devel' required to build 'nvtop' if you need to package it
# for a new OS major version
'/software/packages' = pkg_repl('ncurses-devel');
