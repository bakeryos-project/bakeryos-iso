CURRENT_DIR="$PWD"

sudo pacman -Sy --needed base-devel squashfs-tools dosfstools mtools arch-install-scripts xorriso
chmod +x $CURRENT_DIR/scripts/*
mkdir -p $CURRENT_DIR/build/{pacman/cache,work,out}
mkdir -p $CURRENT_DIR/testing/{pacman/repo,flatpak,hooks}
