CURRENT_DIR="$PWD"

sudo bash "$CURRENT_DIR/scripts/mkiso.sh" \
      -C "$CURRENT_DIR/pacman.conf" \
      -v \
      -w "$CURRENT_DIR/build/work" \
      -o "$CURRENT_DIR/build/out" \
      -r \
      -d \
      "$CURRENT_DIR"
