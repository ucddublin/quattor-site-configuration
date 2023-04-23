unique template features/core/hardware/storage/cards/dell-perc;

include 'common/hardware/raid-cli';

'/software/packages' = pkg_repl('perccli', '007.1020.0000.0000-1', PKG_ARCH_DEFAULT);
