
WORKDIR=$( mktemp -d )

echo "pacman -S --noconfirm rustup bat devtools"
sudo pacman -S --noconfirm rustup bat devtools

(   \
    cd "${WORKDIR}" && \
    git clone "https://aur.archlinux.org/paru.git" . && \
    makepkg -si --noconfirm )


echo "paru" > "/tmp/PM"

