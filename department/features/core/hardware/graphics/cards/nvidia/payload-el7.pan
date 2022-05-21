unique template features/core/hardware/graphics/cards/nvidia/payload-el7;

# Install Nvidia driver for EL7
'/software/packages' = pkg_repl('kmod-nvidia-latest-dkms', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-latest-dkms', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-latest-dkms-cuda', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-latest-dkms-cuda-libs', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-latest-dkms-devel', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-latest-dkms-libs', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-latest-dkms-NvFBCOpenGL', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-latest-dkms-NVML', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-libXNVCtrl', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-libXNVCtrl-devel', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-modprobe-latest-dkms', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-persistenced-latest-dkms', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-settings', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-xconfig-latest-dkms', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);

# Install YUM plugin for Nvidia kernel module packages
'/software/packages' = pkg_repl('yum-plugin-nvidia');
