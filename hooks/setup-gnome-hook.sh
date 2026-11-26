echo "Compiling Gschema 2.0 ..."
glib-compile-schemas /usr/share/glib-2.0/schemas/

echo "Setup Gnome extensions ... "

for dir in /usr/share/gnome-shell/extensions/*; do
    if [ -d "$dir/schemas" ]; then
        echo "Compiling  $dir"
        sudo glib-compile-schemas "$dir/schemas"
    fi
done

# Compile every database under /etc/dconf/db (*.d/ -> binary db).
# This covers both the admin's local.d and BakeryOS's bakeryos.d.
dconf update

echo "Done"
