unique template common/development/cuda;

# Define Nvidia software versions and configure software repositories
include 'common/versions/nvidia';

# Install CUDA software
include format('common/development/cuda/payload-el%s', value('/system/os/version/major'));

# Install packages required by GUI programmes
include 'common/graphics/remote';
