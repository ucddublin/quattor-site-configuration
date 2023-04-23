unique template common/development/cuda/payload-el8;

# Install CUDA software
'/software/packages' = pkg_repl('cuda', CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('cuda-drivers', NVIDIA_DRIVER_VERSION, PKG_ARCH_DEFAULT);

# Install CUDA packages
'/software/packages' = pkg_repl(format('cuda-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cccl-%s', CUDA_PKG_NAME_SUFFIX), '11.6.55-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-command-line-tools-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-compiler-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cudart-%s', CUDA_PKG_NAME_SUFFIX), '11.6.55-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cudart-devel-%s', CUDA_PKG_NAME_SUFFIX), '11.6.55-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cuobjdump-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cupti-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cuxxfilt-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-demo-suite-%s', CUDA_PKG_NAME_SUFFIX), '11.6.55-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-documentation-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-driver-devel-%s', CUDA_PKG_NAME_SUFFIX), '11.6.55-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-gdb-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-gdb-src-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-libraries-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-libraries-devel-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-memcheck-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nsight-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nsight-compute-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nsight-systems-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvcc-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvdisasm-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvml-devel-%s', CUDA_PKG_NAME_SUFFIX), '11.6.55-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvprof-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvprune-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvrtc-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvrtc-devel-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvtx-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvvp-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-runtime-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-samples-%s', CUDA_PKG_NAME_SUFFIX), '11.6.101-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-sanitizer-%s', CUDA_PKG_NAME_SUFFIX), '11.6.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-toolkit-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-toolkit-%s-config-common', CUDA_PKG_NAME_SUFFIX), '11.6.55-1', 'noarch');
'/software/packages' = pkg_repl(format('cuda-toolkit-%s-config-common', '11'), '11.6.55-1', 'noarch');
'/software/packages' = pkg_repl('cuda-toolkit-config-common', '11.6.55-1', 'noarch');
'/software/packages' = pkg_repl(format('cuda-tools-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-visual-tools-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('gds-tools-%s', CUDA_PKG_NAME_SUFFIX), '1.2.1.4-1', PKG_ARCH_DEFAULT);

# Install CUDA libraries
'/software/packages' = pkg_repl(format('libcublas-%s', CUDA_PKG_NAME_SUFFIX), '11.9.2.110-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcublas-devel-%s', CUDA_PKG_NAME_SUFFIX), '11.9.2.110-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcufft-%s', CUDA_PKG_NAME_SUFFIX), '10.7.2.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcufft-devel-%s', CUDA_PKG_NAME_SUFFIX), '10.7.2.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcufile-%s', CUDA_PKG_NAME_SUFFIX), '1.2.1.4-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcufile-devel-%s', CUDA_PKG_NAME_SUFFIX), '1.2.1.4-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcurand-%s', CUDA_PKG_NAME_SUFFIX), '10.2.9.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcurand-devel-%s', CUDA_PKG_NAME_SUFFIX), '10.2.9.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcusolver-%s', CUDA_PKG_NAME_SUFFIX), '11.3.4.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcusolver-devel-%s', CUDA_PKG_NAME_SUFFIX), '11.3.4.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcusparse-%s', CUDA_PKG_NAME_SUFFIX), '11.7.2.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libcusparse-devel-%s', CUDA_PKG_NAME_SUFFIX), '11.7.2.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libnpp-%s', CUDA_PKG_NAME_SUFFIX), '11.6.3.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libnpp-devel-%s', CUDA_PKG_NAME_SUFFIX), '11.6.3.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libnvjpeg-%s', CUDA_PKG_NAME_SUFFIX), '11.6.2.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('libnvjpeg-devel-%s', CUDA_PKG_NAME_SUFFIX), '11.6.2.124-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nsight-compute-2022.1.1', '2022.1.1.2-1', PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('nsight-systems-2021.5.2', '2021.5.2.53_28d0e6e-0', PKG_ARCH_DEFAULT);

# Install CUDA Deep Neural Network
'/software/packages' = pkg_repl(format('cudnn-%s', CUDA_PKG_NAME_SUFFIX), '8.4.0.27-2', PKG_ARCH_DEFAULT);

# Install dependencies for CUDA samples
