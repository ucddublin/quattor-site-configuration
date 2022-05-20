unique template common/versions/nvidia;

# Define an Nvidia driver version for each supported OS major version
final variable nvidia_driver_version_os_map = dict(
    '7x', '440.64.00-1',
    '8x', '510.47.03-1',
);

# Define the Nvidia driver version used
final variable NVIDIA_DRIVER_VERSION = nvidia_driver_version_os_map[value('/system/os/version/name')];

# Define a CUDA version for each supported OS major version
final variable cuda_version_os_map = dict(
    '7x', '10.2.89-1',
    '8x', '11.6.2-1',
);

# Define the Nvidia CUDA version used
final variable CUDA_VERSION = cuda_version_os_map[value('/system/os/version/name')];
final variable CUDA_SHORT_VERSION = join('.', splice(split('\.', CUDA_VERSION), 2, 1));
final variable CUDA_PKG_NAME_SUFFIX = join('-', split('\.', CUDA_SHORT_VERSION));

# Add Nvidia repository for Nvidia drivers and CUDA
variable OS_REPOSITORY_LIST = merge(SELF, list(
    format('nvidia/%s-%s', OS_PLATFORM, PKG_ARCH_DEFAULT),
    format('site/nvidia/%s-%s', OS_PLATFORM, PKG_ARCH_DEFAULT),
));
