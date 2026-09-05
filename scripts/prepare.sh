CURRENT_DIR="$PWD"

sudo pacman -Sy --needed base-devel squashfs-tools dosfstools mtools arch-install-scripts xorriso
chmod +x $CURRENT_DIR/scripts/*
mkdir -p $CURRENT_DIR/build/{pacman/cache,work,out}
mkdir -p $CURRENT_DIR/testing/{pacman/repo,flatpak,hooks}
mkdir -p $CURRENT_DIR/airootfs/etc/skel/{Documents,Downloads,Music,Pictures,Videos}


if [ ! -d "$CURRENT_DIR/airootfs/etc/skel/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git --depth 1 "$CURRENT_DIR/airootfs/etc/skel/.oh-my-zsh"
fi

if [ ! -d "$CURRENT_DIR/airootfs/etc/skel/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git --depth 1 "$CURRENT_DIR/airootfs/etc/skel/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
fi

if [ ! -d "$CURRENT_DIR/airootfs/etc/skel/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git --depth 1 "$CURRENT_DIR/airootfs/etc/skel/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
fi