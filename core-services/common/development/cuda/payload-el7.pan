unique template common/development/cuda/payload-el7;

# Install CUDA software
'/software/packages' = pkg_repl('cuda', CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl('cuda-drivers', NVIDIA_DRIVER_VERSION, PKG_ARCH_DEFAULT);

# Install CUDA packages
'/software/packages' = pkg_repl(format('cuda-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-command-line-tools-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-compiler-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cudart-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cudart-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cufft-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cufft-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cuobjdump-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cupti-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-curand-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-curand-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cusolver-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cusolver-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cusparse-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-cusparse-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-demo-suite-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-documentation-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-driver-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-gdb-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-gdb-src-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-libraries-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-libraries-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-license-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-memcheck-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-misc-headers-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-npp-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-npp-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nsight-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nsight-compute-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nsight-systems-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvcc-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvdisasm-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvgraph-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvgraph-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvjpeg-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvjpeg-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvml-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvprof-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvprune-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvrtc-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvrtc-dev-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvtx-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-nvvp-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-runtime-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-samples-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-sanitizer-api-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-toolkit-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-tools-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);
'/software/packages' = pkg_repl(format('cuda-visual-tools-%s', CUDA_PKG_NAME_SUFFIX), CUDA_VERSION, PKG_ARCH_DEFAULT);

# Install CUDA Deep Neural Network
'/software/packages' = pkg_repl(format('cudnn-%s', CUDA_PKG_NAME_SUFFIX), '7.6.5.32-2', PKG_ARCH_DEFAULT);

# Install dependencies for CUDA samples
'/software/packages' = pkg_repl('vulkan');
'/software/packages' = pkg_repl('vulkan-devel');
'/software/packages' = pkg_repl('glfw');
'/software/packages' = pkg_repl('glfw-devel');
'/software/packages' = pkg_repl('mesa-libGLES');
'/software/packages' = pkg_repl('mesa-libGLES-devel');
