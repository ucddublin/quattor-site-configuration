unique template features/core/hardware/storage/cards/dell-boss;

include 'common/hardware/raid-cli';

'/software/packages' = pkg_repl('mvcli', '5.0.13.1107-A06', PKG_ARCH_DEFAULT);
