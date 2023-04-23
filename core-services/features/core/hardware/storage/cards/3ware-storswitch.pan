unique template features/core/hardware/storage/cards/3ware-storswitch;

include 'common/hardware/raid-cli';

'/software/packages' = pkg_repl('tw_cli', '2.00.11.022-1', PKG_ARCH_DEFAULT);
