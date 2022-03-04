unique template common/graphics/remote;

# Install packages required for running programmes that have a graphical user
# interface over SSH and their development packages as we open compile these
# programmes
'/software/packages' = pkg_repl('libglvnd');
'/software/packages' = pkg_repl('libglvnd-devel');
'/software/packages' = pkg_repl('mesa-dri-drivers');
'/software/packages' = pkg_repl('mesa-libGL');
'/software/packages' = pkg_repl('mesa-libGL-devel');
'/software/packages' = pkg_repl('mesa-libEGL');
'/software/packages' = pkg_repl('mesa-libEGL-devel');
