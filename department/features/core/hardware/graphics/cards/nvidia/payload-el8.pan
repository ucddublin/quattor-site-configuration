unique template features/core/hardware/graphics/cards/nvidia/payload-el8;

# Install Nvidia driver for EL8
'/software/packages' = pkg_repl('kmod-nvidia-latest-dkms', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-cuda', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-cuda-libs', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-devel', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-libs', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-NvFBCOpenGL', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-driver-NVML', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-kmod-common', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), 'noarch');
'/software/packages' = pkg_repl('nvidia-libXNVCtrl', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-libXNVCtrl-devel', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-modprobe', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-persistenced', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-settings', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nvidia-xconfig', format(NVIDIA_DRIVER_VERSION + '.%s', OS_PLATFORM), PKG_ARCH_DEFAULT);

# Install DNF plugin for Nvidia kernel module packages
'/software/packages' = pkg_repl('dnf-plugin-nvidia');
