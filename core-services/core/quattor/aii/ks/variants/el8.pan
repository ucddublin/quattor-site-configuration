template quattor/aii/ks/variants/el8;

# Remove deprecated options
prefix "/system/aii/osinstall/ks";
"mouse" = null;
"langsupport" = null;
"packages_args" = list("--ignoremissing");

"end_script" = "%end";  # TODO: remove - no longer used
"part_label" = true;
"volgroup_required" = false;
"lvmforce" = true;

# el8
"version" = "33.16";
"bootproto" = "static";
"enable_sshd" = true;
"cmdline" = true;

"logging/method" = 'bash';
"logging/protocol" = 'tcp';

# rhel
"eula" = true;
# deal with optional repository
"packagesinpost" ?= true;

prefix "/system/aii/nbp/pxelinux";
"setifnames" = true;
