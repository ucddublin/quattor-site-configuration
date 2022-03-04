unique template rpms/uefi-boot;

prefix '/software/packages';

'{efibootmgr}' ?= dict();
'{efivar-libs}' ?= dict();
'{grub2-efi-x64}' ?= dict();
'{grub2-tools-efi}' ?= dict();
'{shim-x64}' ?= dict();
