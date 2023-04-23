unique template features/core/hardware/storage/cards/lsi-megaraid;

include 'common/hardware/raid-cli';

'/software/packages' = pkg_repl('storcli', '007.1416.0000.0000-1', PKG_ARCH_DEFAULT);
